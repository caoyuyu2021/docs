#include <stdio.h>
#include <stdlib.h>
#include <string.h>

double input_data(int input_column, int output_column, double* a, double* arr, char* p)
{
    //参数读取，input为输入特征维度，output为输出特征维度
    int input;
    int output;
    input = input_column;
    output = output_column;
	double b[input];
	b[input] = 0.0;
	
    //打开文件以便写入数据
    int i;
	FILE *ffp;
	
	//获取数据保存路径
	char* temp_path = getenv("TEMP");
	char* build_data_path = "/middle/build_data.txt";
	char* build_path = (char*)malloc(strlen(temp_path) + strlen(build_data_path));
	sprintf(build_path, "%s%s", temp_path, build_data_path);
	
	ffp=fopen(build_path,"w");
	
	for (i = 0; i<input; i++) { 
      fprintf(ffp,"%f\n",a[i]);
    }

    //写入完毕，关闭文件
    fclose(ffp); 
     
    //模型推理
    char sinput[10];
    sprintf(sinput, "%d" , input);
    char soutput[10];
    sprintf(soutput, "%d" , output);
    char* cmd="call build.bat";
    char* scmd= (char *) malloc(strlen(cmd) + strlen(sinput) + strlen(soutput));
    sprintf(scmd,"%s %s %s",cmd,sinput,soutput);
    int ret = system(scmd);
    printf("ret = %d\n",ret);
    
	//打开文件以便读入数据
	FILE *tfp;
	arr[output] = 0.0;
	
	//获取数据读取路径
	char* infer_data_path = "/middle/infer_data.txt";
	char* infer_path = (char*)malloc(strlen(temp_path) + strlen(infer_data_path));
	sprintf(infer_path, "%s%s", temp_path, infer_data_path);
	
    fopen_s(&tfp, infer_path, "r");
    for (i = 0; i < output; i++) {
        fscanf_s(tfp, "%lf\n", &arr[i]);
    }

    //读入完毕，关闭文件
    fclose(tfp);
    for (i = 0; i < output; i++) {
        printf("%f\n", arr[i]);
    }
	
	//获取传入路径
	printf("path = %s\n",p);
    
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
	
	//传入路径
	char* path = argv[3];
    input_data(feature_arr[0], feature_arr[1], a, arr, path);
}

