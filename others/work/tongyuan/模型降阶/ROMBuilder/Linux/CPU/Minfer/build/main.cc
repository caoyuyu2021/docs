#include <algorithm>
#include <random>
#include <iostream>
#include <fstream>
#include <cstring>
#include <memory>
#include <vector>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include "include/api/model.h"
#include "include/api/context.h"
#include "include/api/status.h"
#include "include/api/types.h"
#define BUFSZ 4096

using mindspore::MSTensor;
using namespace std;
namespace ms = mindspore;

namespace {
constexpr int kNumPrintOfOutData = 50;
}
std::string RealPath(const char *path) {
  const size_t max = 4096;
  if (path == nullptr) {
    std::cerr << "path is nullptr" << std::endl;
    return "";
  }
  if ((strlen(path)) >= max) {
    std::cerr << "path is too long" << std::endl;
    return "";
  }
  auto resolved_path = std::make_unique<char[]>(max);
  if (resolved_path == nullptr) {
    std::cerr << "new resolved_path failed" << std::endl;
    return "";
  }
#ifdef _WIN32
  char *real_path = _fullpath(resolved_path.get(), path, 1024);
#else
  char *real_path = realpath(path, resolved_path.get());
#endif
  if (real_path == nullptr || strlen(real_path) == 0) {
    std::cerr << "file path is not valid : " << path << std::endl;
    return "";
  }
  std::string res = resolved_path.get();
  return res;
}

char *ReadFile(const char *file, size_t *size) {
  if (file == nullptr) {
    std::cerr << "file is nullptr." << std::endl;
    return nullptr;
  }

  std::ifstream ifs(file, std::ifstream::in | std::ifstream::binary);
  if (!ifs.good()) {
    std::cerr << "file: " << file << " is not exist." << std::endl;
    return nullptr;
  }

  if (!ifs.is_open()) {
    std::cerr << "file: " << file << " open failed." << std::endl;
    return nullptr;
  }

  ifs.seekg(0, std::ios::end);
  *size = ifs.tellg();
  std::unique_ptr<char[]> buf(new (std::nothrow) char[*size]);
  if (buf == nullptr) {
    std::cerr << "malloc buf failed, file: " << file << std::endl;
    ifs.close();
    return nullptr;
  }

  ifs.seekg(0, std::ios::beg);
  ifs.read(buf.get(), *size);
  ifs.close();

  return buf.release();
}

int main(int argc, const char *argv[]) {
  //读取输入输出维度，第一维度为输入维度，第二维度为输出维度
  int start_num = 3;
  int pram_num = argc - start_num;
  int feature_arr[pram_num] = {0};
  for (int i = 0; i <= pram_num - 1; ++i){
    int a = atoi(argv[start_num]);
    feature_arr[i] = a;
    start_num += 1;
    std::cout << feature_arr[i] << std::endl;
  }

  //共享内存
  int shmid;
  key_t key;
  double* shmadd;

  //创建key值
  key = ftok("src", 1236);

  //打开共享内存
  shmid = shmget(key, BUFSZ, IPC_CREAT|0666);

  //映射
  shmadd = (double*)shmat(shmid, NULL, 0);
  vector<float> input_data(shmadd, shmadd+feature_arr[0]);

  for (int i = 0; i <= feature_arr[0]-1; ++i){
  std::cout << input_data[i] << std::endl;}

  //分离共享内存和当前进程
  shmdt(shmadd);

  //删除共享内存
  shmctl(shmid, IPC_RMID, NULL);

  // Read model file.
  auto model_path = RealPath(argv[1]);
  size_t size = 0;
  char *model_buf = ReadFile(model_path.c_str(), &size);

  // Create and init context, add CPU device info
  auto context = std::make_shared<mindspore::Context>();
  auto &device_list = context->MutableDeviceInfo();
  auto device_info = std::make_shared<mindspore::CPUDeviceInfo>();
  device_list.push_back(device_info);

  // Create model
  auto model = new (std::nothrow) mindspore::Model();
  
  // Build model
  auto build_ret = model->Build(model_buf, size, mindspore::kMindIR, context);

  // get model inputs
  std::vector<ms::MSTensor> origin_inputs = model->GetInputs();

  // prepare input
  std::vector<ms::MSTensor> outputs;
  std::vector<ms::MSTensor> inputs;
  inputs.emplace_back(origin_inputs[0].Name(), origin_inputs[0].DataType(), origin_inputs[0].Shape(),
                      input_data.data(), sizeof(float) * input_data.size());

  // infer
  model->Predict(inputs, &outputs);

  //共享内存

  //创建key值
  key = ftok("model", 2016);

  //创建共享内存
  shmid = shmget(key, BUFSZ, IPC_CREAT|0666);

  //映射
  shmadd = (double*)shmat(shmid, NULL, 0);

  //输出推理结果
  double arr[feature_arr[1]];
  arr[feature_arr[1]] = 0.0;
  for (auto &buffer : outputs) {
  const float *p = reinterpret_cast<const float *>(buffer.MutableData());
  for (size_t i = 0; i < buffer.DataSize() / sizeof(float); ++i) {
    arr[i] = (double)p[i];
    }
  }

  //拷贝数据至共享内存区
  printf("copy data to shared-memory\n");
  // 共享内存清空
  bzero(shmadd, BUFSZ);
  memcpy(shmadd, arr, sizeof(arr));

  for (size_t i = 0; i <= sizeof(arr)/sizeof(double)-1; ++i){
    std::cout << shmadd[i] << std::endl;}

  //分离共享内存和当前进程
  shmdt(shmadd);

  // print
  std::cout << "Predict model finished." << std::endl;

  return 0;

}
