#include <dirent.h>
#include <cstring>
#include <iostream>
#include <string>
#include <algorithm>
#include <iosfwd>
#include <vector>
#include <fstream>
#include <sstream>
#include <filesystem>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <ostream>
#include "include/api/model.h"
#include "include/api/context.h"
#include "include/api/types.h"
#include "include/api/serialization.h"
#define BUFSZ 4096

using mindspore::Context;
using mindspore::Serialization;
using mindspore::Model;
using mindspore::Status;
using mindspore::ModelType;
using mindspore::GraphCell;
using mindspore::kSuccess;
using mindspore::MSTensor;
using namespace std;

namespace fs = std::filesystem;
namespace ms = mindspore;

int main(int argc, char *argv[]) {
  //读取输入输出维度，第一维度为输入维度，第二维度为输出维度
  int start_num = 3;
  int pram_num = argc - start_num;
  int feature_arr[pram_num] = {0};
  for (int i = 0; i <= pram_num - 1; ++i){
    int a = atoi(argv[start_num]);
    feature_arr[i] = a;
    start_num += 1;
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

  //分离共享内存和当前进程
  shmdt(shmadd);

  //删除共享内存
  shmctl(shmid, IPC_RMID, NULL);

  // set context
  auto context = std::make_shared<Context>();
  auto gpu_device_info = std::make_shared<mindspore::GPUDeviceInfo>();
  gpu_device_info->SetPrecisionMode("fp16");
  context->MutableDeviceInfo().push_back(gpu_device_info);

  //get path
  std::string model_file;
  for (const auto& entry : fs::directory_iterator("../model/")){
    model_file = entry.path();
  }
  
  // define model
  ms::Graph graph;
  ms::Status ret = ms::Serialization::Load(model_file, ms::ModelType::kMindIR, &graph);
  ms::Model model;

  // build model
  ret = model.Build(ms::GraphCell(graph), context);

  // get model inputs
  std::vector<ms::MSTensor> origin_inputs = model.GetInputs();

  // prepare input
  std::vector<ms::MSTensor> outputs;
  std::vector<ms::MSTensor> inputs;
  inputs.emplace_back(origin_inputs[0].Name(), origin_inputs[0].DataType(), origin_inputs[0].Shape(),
                      input_data.data(), sizeof(float) * input_data.size());

  // infer
  ret = model.Predict(inputs, &outputs);

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

  //共享内存清空
  bzero(shmadd, BUFSZ);
  //拷贝数据
  memcpy(shmadd, arr, sizeof(arr));

  //分离共享内存和当前进程
  shmdt(shmadd);

  return 0;
}
