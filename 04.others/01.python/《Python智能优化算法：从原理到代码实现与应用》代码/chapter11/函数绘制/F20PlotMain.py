'''F20绘图函数'''
import numpy as np
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


def F20(X):
    aH=np.array([[10,3,17,3.5,1.7,8],[0.05,10,17,0.1,8,14],[3,3.5,1.7,10,17,8],[17,8,0.05,10,0.1,14]])
    cH=np.array([1,1.2,3,3.2])
    pH=np.array([[0.1312,0.1696,0.5569,0.0124,0.8283,0.5886],[0.2329,0.4135,0.8307,0.3736,0.1004,0.9991],\
                 [0.2348,0.1415,0.3522,0.2883,0.3047,0.6650],[0.4047,0.8828,0.8732,0.5743,0.1091,0.0381]])
    Results=0
    for i in range(4):
        Results=Results-cH[i]*np.exp(-(np.sum(aH[i,:]*((X-pH[i,:]))**2)))
    return Results

def F20Plot():
    fig = plt.figure(1) #定义figure
    ax = Axes3D(fig) #将figure变为3d
    x1=np.arange(0,1,0.05) #定义x1，范围为[0,1],间隔为0.05
    x2=np.arange(0,1,0.05) #定义x2，范围为[0,1],间隔为0.05
    X1,X2=np.meshgrid(x1,x2) #生成网格
    nSize = x1.shape[0]
    Z=np.zeros([nSize,nSize])
    for i in range(nSize):
        for j in range(nSize):
            X=[X1[i,j],X2[i,j],0,0,0,0] #构造F20输入
            X=np.array(X) #将格式由list转换为array
            Z[i,j]=F20(X)  #计算F20的值
    #绘制3D曲面
    # rstride:行之间的跨度  cstride:列之间的跨度
    # rstride:行之间的跨度  cstride:列之间的跨度
    # cmap参数可以控制三维曲面的颜色组合
    ax.plot_surface(X1, X2, Z, rstride = 1, cstride = 1, cmap = plt.get_cmap('rainbow'))
    ax.contour(X1, X2, Z, zdir='z', offset=0)#绘制等高线
    ax.set_xlabel('X1')#x轴说明
    ax.set_ylabel('X2')#y轴说明
    ax.set_zlabel('Z')#z轴说明
    ax.set_title('F20_space')
    plt.show()

F20Plot()