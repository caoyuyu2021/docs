'''F15绘图函数'''
import numpy as np
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


def F15(X):
    aK=np.array([0.1957,0.1947,0.1735,0.16,0.0844,0.0627,0.0456,0.0342,0.0323,0.0235,0.0246])
    bK=np.array([0.25,0.5,1,2,4,6,8,10,12,14,16])
    bK=1/bK
    Results=np.sum((aK-((X[0]*(bK**2+X[1]*bK))/(bK**2+X[2]*bK+X[3])))**2)
    
    return Results

def F15Plot():
    fig = plt.figure(1) #定义figure
    ax = Axes3D(fig) #将figure变为3d
    x1=np.arange(-5,5,0.2) #定义x1，范围为[-5,5],间隔为0.2
    x2=np.arange(-5,5,0.2) #定义x2，范围为[-5,5],间隔为0.2
    X1,X2=np.meshgrid(x1,x2) #生成网格
    nSize = x1.shape[0]
    Z=np.zeros([nSize,nSize])
    for i in range(nSize):
        for j in range(nSize):
            X=[X1[i,j],X2[i,j],0,0] #构造F15输入
            X=np.array(X) #将格式由list转换为array
            Z[i,j]=F15(X)  #计算F15的值
    #绘制3D曲面
    # rstride:行之间的跨度  cstride:列之间的跨度
    # rstride:行之间的跨度  cstride:列之间的跨度
    # cmap参数可以控制三维曲面的颜色组合
    ax.plot_surface(X1, X2, Z, rstride = 1, cstride = 1, cmap = plt.get_cmap('rainbow'))
    ax.contour(X1, X2, Z, zdir='z', offset=0)#绘制等高线
    ax.set_xlabel('X1')#x轴说明
    ax.set_ylabel('X2')#y轴说明
    ax.set_zlabel('Z')#z轴说明
    ax.set_title('F15_space')
    plt.show()

F15Plot()