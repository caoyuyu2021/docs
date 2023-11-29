'''F19绘图函数'''
import numpy as np
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


def F19(X):
    aH=np.array([[3,10,30],[0.1,10,35],[3,10,30],[0.1,10,35]])
    cH=np.array([1,1.2,3,3.2])
    pH=np.array([[0.3689,0.117,0.2673],[0.4699,0.4387,0.747],[0.1091,0.8732,0.5547],[0.03815,0.5743,0.8828]])
    Results=0
    for i in range(4):
        Results=Results-cH[i]*np.exp(-(np.sum(aH[i,:]*((X-pH[i,:]))**2)))
    return Results

def F19Plot():
    fig = plt.figure(1) #定义figure
    ax = Axes3D(fig) #将figure变为3d
    x1=np.arange(1,3,0.1) #定义x1，范围为[1,3],间隔为0.1
    x2=np.arange(1,3,0.1) #定义x2，范围为[1,3],间隔为0.1
    X1,X2=np.meshgrid(x1,x2) #生成网格
    nSize = x1.shape[0]
    Z=np.zeros([nSize,nSize])
    for i in range(nSize):
        for j in range(nSize):
            X=[X1[i,j],X2[i,j],0] #构造F19输入
            X=np.array(X) #将格式由list转换为array
            Z[i,j]=F19(X)  #计算F19的值
    #绘制3D曲面
    # rstride:行之间的跨度  cstride:列之间的跨度
    # rstride:行之间的跨度  cstride:列之间的跨度
    # cmap参数可以控制三维曲面的颜色组合
    ax.plot_surface(X1, X2, Z, rstride = 1, cstride = 1, cmap = plt.get_cmap('rainbow'))
    ax.contour(X1, X2, Z, zdir='z', offset=0)#绘制等高线
    ax.set_xlabel('X1')#x轴说明
    ax.set_ylabel('X2')#y轴说明
    ax.set_zlabel('Z')#z轴说明
    ax.set_title('F19_space')
    plt.show()

F19Plot()