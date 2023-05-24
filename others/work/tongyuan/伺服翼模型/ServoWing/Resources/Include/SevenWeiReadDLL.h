// ���� ifdef ���Ǵ���ʹ�� DLL �������򵥵�
// ��ı�׼�������� DLL �е������ļ��������������϶���� SEVENWEIREADDLL_EXPORTS
// ���ű���ġ���ʹ�ô� DLL ��
// �κ�������Ŀ�ϲ�Ӧ����˷��š�������Դ�ļ��а������ļ����κ�������Ŀ���Ὣ
// SEVENWEIREADDLL_API ������Ϊ�Ǵ� DLL ����ģ����� DLL ���ô˺궨���
// ������Ϊ�Ǳ������ġ�
#ifdef SEVENWEIREADDLL_EXPORTS
#define SEVENWEIREADDLL_API __declspec(dllexport)
#else
#define SEVENWEIREADDLL_API __declspec(dllimport)
#endif

// �����Ǵ� SevenWeiReadDLL.dll ������
#ifdef __cplusplus
extern "C"{
#endif

	/*
	*��ʼ��
	*@param path [in] �ļ�·��
	*@return 0:�ɹ���-1��ʧ��
	*/
	SEVENWEIREADDLL_API int SW_Init(void* path);

	/*
	*��ȡһ������
	*@param line [in] ��ȡ��һ��
	*@param out_data [out] һ������
	*@param out_data_len [out] һ�������а�����double����
	*@return 0:�ɹ���-1��ʧ��
	*/
	SEVENWEIREADDLL_API int SW_GetLine(int line_num, double* out_data, int* out_data_len);

	/*
	*�ͷ�
	*/
	SEVENWEIREADDLL_API void SW_Terminate();


#ifdef __cplusplus
}
#endif