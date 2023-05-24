#include <algorithm>
#include <random>
#include <iostream>
#include <fstream>
#include <cstring>
#include <memory>
#include <vector>
#include <stdio.h>
#include "include/api/model.h"
#include "include/api/context.h"
#include "include/api/status.h"
#include "include/api/types.h"

using mindspore::MSTensor;
using namespace std;
namespace ms = mindspore;

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

int main(int argc, const char **argv) {
  //argc为传入参数个数：共六个
  //argc为传入参数含义：第一个为call main.exe，第二个为../model/servowing.ms，第三个为输入维度，第四个为输出维度，第五个为build_data路径，第六个为infer_data路径
  int start_num = 2;//维度从下标2开始，到3结束
  int input = atoi(argv[start_num]);

  cout << argv[5] << endl;
  
  double b[input];
  b[input] = 0.0;
  
  int inputlen = 0;
  ifstream ffile(argv[4]);
  while (inputlen < input) {
      ffile >> b[inputlen];
	  inputlen++;
  }
  for (int j = 0; j < inputlen; j++)
  {
      cout << b[j] << "\n";
  }
  ffile.close();
  vector<float> input_data(b, b + input);
  
  for (int i = 0; i <= input-1; ++i) {
	  cout << input_data[i] << endl;
  }
  
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

  //输出推理结果
  int outputlen = 0;
  ofstream tfile(argv[5]);
  for (auto &buffer : outputs) {
  const float *p = reinterpret_cast<const float *>(buffer.MutableData());
  for (size_t i = 0; i < buffer.DataSize() / sizeof(float); ++i) {
    tfile << (double)p[i] << "\n";
	cout << p[i] << "\n";
    }
  }
  tfile.close();
  
  // print
  std::cout << "Predict model finished." << std::endl;
  
  return 0;
}
