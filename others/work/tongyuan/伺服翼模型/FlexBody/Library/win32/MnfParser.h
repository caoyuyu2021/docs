/********************************************************************
 Copyright (c) 2010-2015, ����ͬԪ�����Ϣ�������޹�˾
 All rights reserved.

 @file       MnfParser.h
 @brief      �����������mnf�ļ�����, �Լ�9������ʱ�������ļ���

 @version    v1.0
 @author     �źͻ�
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

// ���ò��裺
/*
 * 1. ���ó�ʼ������
 * 2. �������ݽӿں�����������ȡ������ʽ, ����������ݵĻ�ȡ��
 * 3. �����������
 */

// ����:
//   ����㣺���û�ָ��, �ڵ���InitMnfʱ����;
//   ��Чģ̬�����û�ָ��, �ڵ���InitMnfʱ����;
//   valid_node_num: ��Чģ̬��Ŀ;
//   interface_node_num: �������Ŀ;

// ���Ľ�: 
//   �ڵ���9������ʱ�������֮ǰ��Ҫ���һЩ���ݣ���ʡ�ڴ棩

//
// ��ʼ�������
//

/*
 *	@param	szMnfName	    [����]mnf�ļ�������·����
 *	@param	pInterfaceId	[����]���н�����Id��һά���飩
 *	@param	nSize1			  [����]�����Id����Ĵ�С
 *  @param  pInvalidMode  [����]����ѡ��ģ̬��һά���飩 
 *  @param  nSize2        [����]ѡ��ģ̬����Ĵ�С
 *  @note   
 */
EXTERN_C int InitMnf(const char* szMnfName,
                     int* pInterfaceId, int nSize1,
                     int* pSelectMode, int nSize2);

// mnf�����������
EXTERN_C int ClearMnf();

//
// ���ݽӿ�
//

// ��ȡ�ڵ���Ŀ
EXTERN_C int GetNodeNum();

// ��ȡ�ڵ������ά��
EXTERN_C int GetNodeDim();

// ��ȡģ̬����������ģ̬��������Ч�ĺ���Ч��
EXTERN_C int GetModeNum();

// ��ȡ�������
//EXTERN_C int GetInterfaceNum();

// ��ȡ�����Id
//EXTERN_C void GetInterfaceId(int* pInterfaceId);

// ���ɷ��Գƾ�������Ϊ[3]�����Ϊ[3*3]
EXTERN_C void GetSkew(double* pPoint, double* pMat);


//***************��������ӿ�(���ȿ��ǣ�Ч�ʸ�)***************//

// ע�������ӿڵ�ÿ��������ֵҪ���뵥���ӿڵĴ�ֵҪ����ͬ���μ������ӿ�˵��

// ��ȡ�ڵ�����ͽڵ�����, ����������
EXTERN_C void GetNodeCorAndMass(double* pNodeCor, double* pNodeMass);

// ��ȡģ̬����(λ�ƺͽ�λ��)������������
EXTERN_C void GetPhi(double* pTPhi, double* pRPhi);

/**
 * @brief ��ȡ����ֵ����(����ֵ��Ƶ�ʡ���Ƶ�ʡ���������������նȡ�����ϵ��)  
 * @note  i)  ����ֵ��Ƶ�ʡ���Ƶ�ʡ���������������նȶ���Mnf�ļ���ȡ
 *        ii) ����ϵ���������
 *            Ƶ��<100, ȡ0.01;
 *            Ƶ��<1000, ȡ0.1;
 *            ����, ȡ1.0;
 */
EXTERN_C void GetEigenvalues(double* pEigenvalue, double* pFrequency,
							               double* pRadian, double* pGenMass,
                             double* pGenStiff, double* pDamping);

/**
 * @brief ��ȡ��2��3��4��7������ʱ�������  
 *
 * @note  ���Ҫ��ȡ��2��3��4��7�����������, ��ο�GetInvar237��ʵ��, �ܼ�
 */
EXTERN_C void GetInvar2347(double* pInvar2, double* pInvar3,
                           double* pInvar4, double* pInvar7);

// ��ȡ��2��3��7������ʱ�������
EXTERN_C void GetInvar237(double* pInvar2, double* pInvar3, double* pInvar7);

// ��ȡ��5��8������ʱ�������
EXTERN_C void GetInvar58(double* pInvar5, double* pInvar8);

// ��9������ʱ����֮ǰ���ô˺��������Խ�ʡ�ڴ�����
/* 
 *	������ڴ����������ֵ��Ƶ�ʡ���Ƶ�ʡ���������������նȡ�
 *  ���нڵ��ƽ��ģ̬��ת��ģ̬
 */
//EXTERN_C void ClearBeforeInvar();

//*************�������ݻ�ȡ�ӿ�(���������ǣ�Ч�ʵ�)*************//

//! 9������ʱ�������

// ��ȡ��1��ʱ������Ծ��󣬱���
EXTERN_C double GetInvar1();

// ��ȡ��2��ʱ������Ծ���[3]
EXTERN_C void GetInvar2(double* pInvar2);

// ��ȡ��3��ʱ������Ծ���[3][valid_mode_num]
EXTERN_C void GetInvar3(double* pInvar3);

// ��ȡ��4��ʱ������Ծ���[3][valid_mode_num]
EXTERN_C void GetInvar4(double* pInvar4);

// ��ȡ��5��ʱ������Ծ���[valid_mode_num][3][valid_mode_num]
EXTERN_C void GetInvar5(double* pInvar5);

// ��ȡ��6��ʱ������Ծ��󣬶Խ�����Ϊ[valid_mode_num]
// ��ο���������
//EXTERN_C void GetInvar6(double* pInvar6);

// ��ȡ��7��ʱ������Ծ���[3][3]
EXTERN_C void GetInvar7(double* pInvar7);

// ��ȡ��8��ʱ������Ծ���[valid_mode_num][3][3]
EXTERN_C void GetInvar8(double* pInvar8);

// ��ȡ��9��ʱ������Ծ���[valid_mode_num][valid_mode_num][3][3]
EXTERN_C void GetInvar9(double* pInvar9);

//! �ڵ���ģ̬

// ��ȡ�ڵ����꣬[interface_node_num][3]
/*
 *	@param	pNodeCoord	[���]�ڵ��������(����������)
 */
EXTERN_C void GetNodeCoord(double* pNodeCoord);

// ��ȡ�ڵ�������[interface_node_num]
/*
 *	@param	pNodeMass	[���]�ڵ���������(����������)
 */
EXTERN_C void GetNodeMass(double* pNodeMass);

// ��ȡƽ��ģ̬����(Ҳ��ģ̬����λ��)��[interface_node_num][3][valid_mode_num]
/*
 *	@param	pTPhi	[���]ģ̬����λ��(����������)
 */
EXTERN_C void GetTPhi(double* pTPhi);

// ��ȡת��ģ̬����(Ҳ��ģ̬�����λ��)��[interface_node_num][3][valid_mode_num]
/*
 *	@param	pRPhi	[���]ģ̬�����λ��(����������)
 */
EXTERN_C void GetRPhi(double* pRPhi);

//! ����ֵ

// ��ȡ����ֵ�����н�Ƶ��ƽ������[valid_mode_num]
EXTERN_C void GetEigenvalue(double* pEigenvalue);

// ��ȡ����Ƶ�ʾ���[valid_mode_num]
EXTERN_C void GetFrequency(double* pFrequency);

// ��ȡ���н�Ƶ�ʣ�[valid_mode_num]
EXTERN_C void GetRadFrequency(double* pRadFrequency);

// ��ȡ����������[valid_mode_num]
EXTERN_C void GetGenMass(double* pGenMass);

// ��ȡ����նȣ�[valid_mode_num]
EXTERN_C void GetGenStiff(double* pGenStiff);

// ��ȡ����ϵ����[valid_mode_num]
EXTERN_C void GetDamping(double* pDamping);

#endif //_MNF_PARSER_H_