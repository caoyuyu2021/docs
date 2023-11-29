import numpy as np
from matplotlib import pyplot as plt
import BOA
import SMA
import SOA
import SSA
import WOA
import TestFun

'''5种测试函数对比程序'''

'''主函数 '''
#设置参数
pop = 30 #种群数量
MaxIter = 200 #最大迭代次数
dim = 30 #维度
lb = -100*np.ones([dim, 1]) #下边界
ub = 100*np.ones([dim, 1])#上边界
#选择适应度函数,F1-F8
fobj = TestFun.F1

Iter = 30 #运行次数

#用于存放每次实验的最优适应度值
GbestScoreSMA=np.zeros([Iter])
GbestScoreBOA=np.zeros([Iter])
GbestScoreSOA=np.zeros([Iter])
GbestScoreSSA=np.zeros([Iter])
GbestScoreWOA=np.zeros([Iter])
#用于存放每次实验的最优解
GbestPositonSMA=np.zeros([Iter,dim])
GbestPositonBOA=np.zeros([Iter,dim])
GbestPositonSOA=np.zeros([Iter,dim])
GbestPositonSSA=np.zeros([Iter,dim])
GbestPositonWOA=np.zeros([Iter,dim])

#用于存放每次迭代，迭代曲线
CurveSMA=np.zeros([Iter,MaxIter])
CurveBOA=np.zeros([Iter,MaxIter])
CurveSOA=np.zeros([Iter,MaxIter])
CurveSSA=np.zeros([Iter,MaxIter])
CurveWOA=np.zeros([Iter,MaxIter])
for i in range(Iter):
    print('第'+str(i),'次实验')
    #黏菌算法
    GbestScoreSMA[i],GbestPositonSMA[i,:],CurveSMAT = SMA.SMA(pop,dim,lb,ub,MaxIter,fobj) 
    CurveSMA[i,:]=CurveSMAT.T
    #蝴蝶优化算法
    GbestScoreBOA[i],GbestPositonBOA[i,:],CurveBOAT = BOA.BOA(pop,dim,lb,ub,MaxIter,fobj) 
    CurveBOA[i,:]=CurveBOAT.T
    #海鸥优化算法
    GbestScoreSOA[i],GbestPositonSOA[i,:],CurveSOAT = SOA.SOA(pop,dim,lb,ub,MaxIter,fobj) 
    CurveSOA[i,:]=CurveSOAT.T
    #麻雀搜索算法
    GbestScoreSSA[i],GbestPositonSSA[i,:],CurveSSAT = SSA.SSA(pop,dim,lb,ub,MaxIter,fobj) 
    CurveSSA[i,:]=CurveSSAT.T
    #鲸鱼优化算法
    GbestScoreWOA[i],GbestPositonWOA[i,:],CurveWOAT = WOA.WOA(pop,dim,lb,ub,MaxIter,fobj) 
    CurveWOA[i,:]=CurveWOAT.T

'''统计结果'''
SMAMean=np.mean(GbestScoreSMA) #计算平均适应度值
SMAStd=np.std(GbestScoreSMA)#计算标准差
SMABest=np.min(GbestScoreSMA)#计算最优值
SMAWorst=np.max(GbestScoreSMA)#计算最差值
SMAMeanCurve=CurveSMA.mean(axis=0) #求平均适应度曲线

BOAMean=np.mean(GbestScoreBOA) #计算平均适应度值
BOAStd=np.std(GbestScoreBOA)#计算标准差
BOABest=np.min(GbestScoreBOA)#计算最优值
BOAWorst=np.max(GbestScoreBOA)#计算最差值
BOAMeanCurve=CurveBOA.mean(axis=0) #求平均适应度曲线

SOAMean=np.mean(GbestScoreSOA) #计算平均适应度值
SOAStd=np.std(GbestScoreSOA)#计算标准差
SOABest=np.min(GbestScoreSOA)#计算最优值
SOAWorst=np.max(GbestScoreSOA)#计算最差值
SOAMeanCurve=CurveSOA.mean(axis=0) #求平均适应度曲线

SSAMean=np.mean(GbestScoreSSA) #计算平均适应度值
SSAStd=np.std(GbestScoreSSA)#计算标准差
SSABest=np.min(GbestScoreSSA)#计算最优值
SSAWorst=np.max(GbestScoreSSA)#计算最差值
SSAMeanCurve=CurveSSA.mean(axis=0) #求平均适应度曲线

WOAMean=np.mean(GbestScoreWOA) #计算平均适应度值
WOAStd=np.std(GbestScoreWOA)#计算标准差
WOABest=np.min(GbestScoreWOA)#计算最优值
WOAWorst=np.max(GbestScoreWOA)#计算最差值
WOAMeanCurve=CurveWOA.mean(axis=0) #求平均适应度曲线


'''打印结果'''
print('黏菌算法'+str(Iter)+'次实验结果：')
print('平均适应度值:',SMAMean)
print('标准差:',SMAStd)
print('最优值:',SMABest)
print('最差值:',SMAWorst)

print('蝴蝶优化算法'+str(Iter)+'次实验结果：')
print('平均适应度值:',BOAMean)
print('标准差:',BOAStd)
print('最优值:',BOABest)
print('最差值:',BOAWorst)

print('海鸥优化算法'+str(Iter)+'次实验结果：')
print('平均适应度值:',SOAMean)
print('标准差:',SOAStd)
print('最优值:',SOABest)
print('最差值:',SOAWorst)

print('麻雀搜索算法'+str(Iter)+'次实验结果：')
print('平均适应度值:',SSAMean)
print('标准差:',SSAStd)
print('最优值:',SSABest)
print('最差值:',SSAWorst)

print('鲸鱼优化算法'+str(Iter)+'次实验结果：')
print('平均适应度值:',WOAMean)
print('标准差:',WOAStd)
print('最优值:',WOABest)
print('最差值:',WOAWorst)


#绘制适应度曲线
plt.figure(1)
plt.semilogy(SMAMeanCurve,linewidth=2,linestyle=':')
plt.semilogy(BOAMeanCurve,linewidth=2,linestyle='-')
plt.semilogy(SOAMeanCurve,linewidth=2,linestyle='-.')
plt.semilogy(SSAMeanCurve,linewidth=2,linestyle='--')
plt.semilogy(WOAMeanCurve,linewidth=2,linestyle='--')
plt.xlabel('Iteration',fontsize='medium')
plt.ylabel("Fitness",fontsize='medium')
plt.grid()
plt.title('F1 function Iterative curve',fontsize='large')
plt.legend(['SMA','BOA','SOA','SSA','WOA'], loc='upper right')
plt.show()


#绘制适应度曲线,当测试F8时，用下面程序画图
'''
plt.figure(1)
plt.plot(SMAMeanCurve,linewidth=2,linestyle=':')
plt.plot(BOAMeanCurve,linewidth=2,linestyle='-')
plt.plot(SOAMeanCurve,linewidth=2,linestyle='-.')
plt.plot(SSAMeanCurve,linewidth=2,linestyle='--')
plt.plot(WOAMeanCurve,linewidth=2,linestyle='--')
plt.xlabel('Iteration',fontsize='medium')
plt.ylabel("Fitness",fontsize='medium')
plt.grid()
plt.title('F8 function Iterative curve',fontsize='large')
plt.legend(['SMA','BOA','SOA','SSA','WOA'], loc='upper right')
plt.show()
'''