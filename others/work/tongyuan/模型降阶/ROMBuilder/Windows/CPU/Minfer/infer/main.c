#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <direct.h>

double input_data(int input_column, int output_column, double* a, double* arr, char* p)
{
    //参数读取，input为输入特征维度，output为输出特征维度
    int input = input_column;
    int output = output_column;
	
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
	char* cmd_1 = "cd ";
    char* cmd_2 = "/d ";
	char* cmd_3 = p;
    char* cmd_4 = "/infer & call infer.bat";
    char* scmd= (char *) malloc(strlen(cmd_1) + strlen(cmd_2) + strlen(cmd_3) + strlen(cmd_4) + strlen(sinput) + strlen(soutput));
    sprintf(scmd,"%s%s%s%s %s %s",cmd_1,cmd_2,cmd_3,cmd_4,sinput,soutput);
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
    
    return 0;
}
