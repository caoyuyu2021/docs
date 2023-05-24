/********************************************************************
 Copyright (c) 2010-2015, 苏州同元软控信息技术有限公司
 All rights reserved.

 @file       MnfParser.h
 @brief      用于柔性体的mnf文件解析, 以及9个惯性时不变矩阵的计算

 @version    v1.0
 @author     张和华
 @date       2011-6-16
*********************************************************************/

#ifndef _MNF_PARSER_H_
#define _MNF_PARSER_H_

#ifndef EXTERN_C
#ifdef __cplusplus
#define EXTERN_C    extern "C"
#else
#define EXTERN_C    extern
#endif
#endif

#include <cstdlib>

// 调用步骤：
/*
 * 1. 调用初始化函数
 * 2. 调用数据接口函数（尽量采取批量方式, 完成所有数据的获取）
 * 3. 调用清除函数
 */

// 术语:
//   界面点：由用户指定, 在调用InitMnf时传入;
//   有效模态：由用户指定, 在调用InitMnf时传入;
//   valid_node_num: 有效模态数目;
//   interface_node_num: 界面点数目;

// 待改进: 
//   在调用9个惯性时不变矩阵（之前需要清除一些数据，节省内存）

//
// 初始化与清除
//

/*
 *	@param	szMnfName	    [输入]mnf文件的完整路径名
 *	@param	pInterfaceId	[输入]所有界面点的Id（一维数组）
 *	@param	nSize1			  [输入]界面点Id数组的大小
 *  @param  pInvalidMode  [输入]所有选中模态（一维数组） 
 *  @param  nSize2        [输入]选中模态数组的大小
 *  @note   
 */
EXTERN_C int InitMnf(const char* szMnfName,
                     int* pInterfaceId, int nSize1,
                     int* pSelectMode, int nSize2);

// mnf缓存数据清除
EXTERN_C int ClearMnf();

//
// 数据接口
//

// 获取节点数目
EXTERN_C int GetNodeNum();

// 获取节点的坐标维数
EXTERN_C int GetNodeDim();

// 获取模态阶数：所有模态，包括无效的和有效的
EXTERN_C int GetModeNum();

// 获取界面点数
//EXTERN_C int GetInterfaceNum();

// 获取界面点Id
//EXTERN_C void GetInterfaceId(int* pInterfaceId);

// 生成反对称矩阵，输入为[3]，输出为[3*3]
EXTERN_C void GetSkew(double* pPoint, double* pMat);


//***************批量处理接口(优先考虑，效率高)***************//

// 注：批量接口的每个参数传值要求，与单个接口的传值要求相同，参见单个接口说明

// 获取节点坐标和节点质量, 仅计算界面点
EXTERN_C void GetNodeCorAndMass(double* pNodeCor, double* pNodeMass);

// 获取模态振型(位移和角位移)，仅计算界面点
EXTERN_C void GetPhi(double* pTPhi, double* pRPhi);

/**
 * @brief 获取特征值属性(特征值、频率、角频率、广义质量、广义刚度、阻尼系数)  
 * @note  i)  特征值、频率、角频率、广义质量、广义刚度都从Mnf文件读取
 *        ii) 阻尼系数计算规则：
 *            频率<100, 取0.01;
 *            频率<1000, 取0.1;
 *            其余, 取1.0;
 */
EXTERN_C void GetEigenvalues(double* pEigenvalue, double* pFrequency,
							               double* pRadian, double* pGenMass,
                             double* pGenStiff, double* pDamping);

/**
 * @brief 获取第2、3、4、7个惯性时不变矩阵  
 *
 * @note  如果要获取第2、3、4、7个的任意组合, 请参考GetInvar237的实现, 很简单
 */
EXTERN_C void GetInvar2347(double* pInvar2, double* pInvar3,
                           double* pInvar4, double* pInvar7);

// 获取第2、3、7个惯性时不变矩阵
EXTERN_C void GetInvar237(double* pInvar2, double* pInvar3, double* pInvar7);

// 获取第5、8个惯性时不变矩阵
EXTERN_C void GetInvar58(double* pInvar5, double* pInvar8);

// 在9个惯性时不变之前调用此函数，可以节省内存消耗
/* 
 *	清除的内存包括：特征值、频率、角频率、广义质量、广义刚度、
 *  所有节点的平动模态和转动模态
 */
//EXTERN_C void ClearBeforeInvar();

//*************单个数据获取接口(尽量不考虑，效率低)*************//

//! 9个惯性时不变矩阵

// 获取第1个时不变惯性矩阵，标量
EXTERN_C double GetInvar1();

// 获取第2个时不变惯性矩阵，[3]
EXTERN_C void GetInvar2(double* pInvar2);

// 获取第3个时不变惯性矩阵，[3][valid_mode_num]
EXTERN_C void GetInvar3(double* pInvar3);

// 获取第4个时不变惯性矩阵，[3][valid_mode_num]
EXTERN_C void GetInvar4(double* pInvar4);

// 获取第5个时不变惯性矩阵，[valid_mode_num][3][valid_mode_num]
EXTERN_C void GetInvar5(double* pInvar5);

// 获取第6个时不变惯性矩阵，对角向量为[valid_mode_num]
// 请参考广义质量
//EXTERN_C void GetInvar6(double* pInvar6);

// 获取第7个时不变惯性矩阵，[3][3]
EXTERN_C void GetInvar7(double* pInvar7);

// 获取第8个时不变惯性矩阵，[valid_mode_num][3][3]
EXTERN_C void GetInvar8(double* pInvar8);

// 获取第9个时不变惯性矩阵，[valid_mode_num][valid_mode_num][3][3]
EXTERN_C void GetInvar9(double* pInvar9);

//! 节点与模态

// 获取节点坐标，[interface_node_num][3]
/*
 *	@param	pNodeCoord	[输出]节点坐标矩阵(仅计算界面点)
 */
EXTERN_C void GetNodeCoord(double* pNodeCoord);

// 获取节点质量，[interface_node_num]
/*
 *	@param	pNodeMass	[输出]节点质量矩阵(仅计算界面点)
 */
EXTERN_C void GetNodeMass(double* pNodeMass);

// 获取平动模态振型(也叫模态广义位移)，[interface_node_num][3][valid_mode_num]
/*
 *	@param	pTPhi	[输出]模态广义位移(仅计算界面点)
 */
EXTERN_C void GetTPhi(double* pTPhi);

// 获取转动模态振型(也叫模态广义角位移)，[interface_node_num][3][valid_mode_num]
/*
 *	@param	pRPhi	[输出]模态广义角位移(仅计算界面点)
 */
EXTERN_C void GetRPhi(double* pRPhi);

//! 特征值

// 获取特征值（固有角频率平方），[valid_mode_num]
EXTERN_C void GetEigenvalue(double* pEigenvalue);

// 获取固有频率矩阵，[valid_mode_num]
EXTERN_C void GetFrequency(double* pFrequency);

// 获取固有角频率，[valid_mode_num]
EXTERN_C void GetRadFrequency(double* pRadFrequency);

// 获取广义质量，[valid_mode_num]
EXTERN_C void GetGenMass(double* pGenMass);

// 获取广义刚度，[valid_mode_num]
EXTERN_C void GetGenStiff(double* pGenStiff);

// 获取阻尼系数，[valid_mode_num]
EXTERN_C void GetDamping(double* pDamping);

#endif //_MNF_PARSER_H_