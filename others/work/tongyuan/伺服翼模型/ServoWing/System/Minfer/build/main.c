#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>

double input_data(int input_column, int output_column, double* a, double* arr)
{
    //参数读取，input为输入特征维度，output为输出特征维度
  
    int input;
    int output;
    input = input_column;
    output = output_column;
    int arr_feature[2];
    arr_feature[0] = input;
    arr_feature[1] = output;
    
    //内存共享变量定义
    int shmid;
    key_t key;
    int size = 4096;
    int *shmadd_f;
    double *shmadd;
    
    //数据读取
    double data[input];
    data[input] = 0.0;
    int i;
    for (i=0; i<=input-1; i++){
    data[i] = a[i];}
    
    //创建key值
    key = ftok("src", 1236);
    
    //创建共享内存
    shmid = shmget(key, size, 0666|IPC_CREAT);

    //挂载共享内存
    shmadd = (double*)shmat(shmid,NULL,0);
    
    //共享内存清空
    bzero(shmadd, size); 
    
    //共享内存写入数据
    memcpy(shmadd, data, sizeof(data));

    //模型推理
    char sinput[10];
    sprintf(sinput, "%d" , input);
    char soutput[10];
    sprintf(soutput, "%d" , output);
    char* cmd="sh build.sh";
    char* scmd= (char *) malloc(strlen(cmd) + strlen(sinput) + strlen(soutput));
    sprintf(scmd,"%s %s %s",cmd,sinput,soutput);
    int ret = system(scmd);
    
    //创建key值
    key = ftok("model", 2016);

    //打开共享内存
    shmid = shmget(key, size, IPC_CREAT|0666);

    //映射
    shmadd = (double*)shmat(shmid, NULL, 0);

    //读共享内存区数据
    arr[output] = 0.0;
    for (int i = 0; i <= output-1; ++i){
    arr[i] = (double)shmadd[i];}
    
    //分离共享内存和当前进程
    shmdt(shmadd);

    //删除共享内存
    shmctl(shmid, IPC_RMID, NULL);
    
    printf("\nBuild model finished.\n");
    printf("\n");
    
    return 0;
}

int main(int argc, char **argv)
{
    //读取输入输出维度，第一维度为输入维度，第二维度为输出维度
    int feature_arr[argc];
    feature_arr[argc] = 0;

    int j = 0;
    for (int i = 1; i < argc; ++i){
      feature_arr[j] = atoi(argv[i]);
      j +=1;
    }
    
    double a[feature_arr[0]];
    for (int i = 0; i < feature_arr[0]; ++i){
      a[i] = 0.0;
    }
    
    double arr[feature_arr[1]];
    input_data(feature_arr[0], feature_arr[1], a, arr);
}

