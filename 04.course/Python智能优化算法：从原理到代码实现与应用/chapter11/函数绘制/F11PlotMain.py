'''F11绘图函数'''
import numpy as np
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def F11(X):
    dim=X.shape[0]
    Temp=np.arange(1,dim,1)
    Results=np.sum(X**2)/4000-np.prod(np.cos(X/np.sqrt(Temp)))+1

    return Results

def F11Plot():
    fig = plt.figure(1) #定义figure
    ax = Axes3D(fig) #将figure变为3d
    x1=np.arange(-600,600,5) #定义x1，范围为[-600,600],间隔为5
    x2=np.arange(-600,600,5) #定义x2，范围为[-600,600],间隔为5
    X1,X2=np.meshgrid(x1,x2) #生成网格
    nSize = x1.shape[0]
    Z=np.zeros([nSize,nSize])
    for i in range(nSize):
        for j in range(nSize):
            X=[X1[i,j],X2[i,j]] #构造F11输入
            X=np.array(X) #将格式由list转换为array
            Z[i,j]=F11(X)  #计算F11的值
    #绘制3D曲面
    # rstride:行之间的跨度  cstride:列之间的跨度
    # rstride:行之间的跨度  cstride:列之间的跨度
    # cmap参数可以控制三维曲面的颜色组合
    ax.plot_surface(X1, X2, Z, rstride = 1, cstride = 1, cmap = plt.get_cmap('rainbow'))
    ax.contour(X1, X2, Z, zdir='z', offset=0)#绘制等高线
    ax.set_xlabel('X1')#x轴说明
    ax.set_ylabel('X2')#y轴说明
    ax.set_zlabel('Z')#z轴说明
    ax.set_title('F11_space')
    plt.show()

F11Plot()