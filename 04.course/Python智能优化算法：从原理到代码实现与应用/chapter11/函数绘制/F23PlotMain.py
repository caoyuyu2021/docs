'''F23绘图函数'''
import numpy as np
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


def F23(X):
    aSH=np.array([[4,4,4,4],[1,1,1,1],[8,8,8,8],[6,6,6,6],[3,7,3,7],\
                  [2,9,2,9],[5,5,3,3],[8,1,8,1],[6,2,6,2],[7,3.6,7,3.6]])
    cSH=np.array([0.1,0.2,0.2,0.4,0.4,0.6,0.3,0.7,0.5,0.5])
    Results=0
    for i in range(10):
        Results=Results-(np.dot((X-aSH[i,:]),(X-aSH[i,:]).T)+cSH[i])**(-1)
    return Results

def F23Plot():
    fig = plt.figure(1) #定义figure
    ax = Axes3D(fig) #将figure变为3d
    x1=np.arange(0,10,0.5) #定义x1，范围为[0,10],间隔为0.5
    x2=np.arange(0,10,0.5) #定义x2，范围为[0,10],间隔为0.5
    X1,X2=np.meshgrid(x1,x2) #生成网格
    nSize = x1.shape[0]
    Z=np.zeros([nSize,nSize])
    for i in range(nSize):
        for j in range(nSize):
            X=[X1[i,j],X2[i,j],0,0] #构造F23输入
            X=np.array(X) #将格式由list转换为array
            Z[i,j]=F23(X)  #计算F23的值
    #绘制3D曲面
    # rstride:行之间的跨度  cstride:列之间的跨度
    # rstride:行之间的跨度  cstride:列之间的跨度
    # cmap参数可以控制三维曲面的颜色组合
    ax.plot_surface(X1, X2, Z, rstride = 1, cstride = 1, cmap = plt.get_cmap('rainbow'))
    ax.contour(X1, X2, Z, zdir='z', offset=-0.1)#绘制等高线
    ax.set_xlabel('X1')#x轴说明
    ax.set_ylabel('X2')#y轴说明
    ax.set_zlabel('Z')#z轴说明
    ax.set_title('F23_space')
    plt.show()

F23Plot()