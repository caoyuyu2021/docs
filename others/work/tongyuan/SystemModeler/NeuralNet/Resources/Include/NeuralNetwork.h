
#ifndef NEURALNETWORK_H
#define NEURALNETWORK_H

#include "onnxruntime_c_api.h"

#if defined(_MSC_VER)
//  Microsoft VC++
#define EXPORT __declspec(dllexport)
#else
//  GCC
#define EXPORT __attribute__((visibility("default")))
#endif

#ifdef __cplusplus
extern "C" {
#endif
EXPORT void* onnx_constructor(const char* model_path);
EXPORT void onnx_destructor(void* wrapper_v);
EXPORT void multiple_input_output(void* wrapper_v, double* x, const size_t in_dim, double* out, const size_t out_dim);
#ifdef __cplusplus
}
#endif
#endif
