// 下列 ifdef 块是创建使从 DLL 导出更简单的
// 宏的标准方法。此 DLL 中的所有文件都是用命令行上定义的 SEVENWEIREADDLL_EXPORTS
// 符号编译的。在使用此 DLL 的
// 任何其他项目上不应定义此符号。这样，源文件中包含此文件的任何其他项目都会将
// SEVENWEIREADDLL_API 函数视为是从 DLL 导入的，而此 DLL 则将用此宏定义的
// 符号视为是被导出的。
#ifdef SEVENWEIREADDLL_EXPORTS
#define SEVENWEIREADDLL_API __declspec(dllexport)
#else
#define SEVENWEIREADDLL_API __declspec(dllimport)
#endif

// 此类是从 SevenWeiReadDLL.dll 导出的
#ifdef __cplusplus
extern "C"{
#endif

	/*
	*初始化
	*@param path [in] 文件路径
	*@return 0:成功，-1：失败
	*/
	SEVENWEIREADDLL_API int SW_Init(void* path);

	/*
	*获取一行数据
	*@param line [in] 获取哪一行
	*@param out_data [out] 一行数据
	*@param out_data_len [out] 一行数据中包含的double个数
	*@return 0:成功，-1：失败
	*/
	SEVENWEIREADDLL_API int SW_GetLine(int line_num, double* out_data, int* out_data_len);

	/*
	*释放
	*/
	SEVENWEIREADDLL_API void SW_Terminate();


#ifdef __cplusplus
}
#endif