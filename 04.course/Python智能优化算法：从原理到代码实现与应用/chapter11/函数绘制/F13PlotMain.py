'''F13绘图函数'''
import numpy as np
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


def Ufun(x,a,k,m):
    Results=k*((x-a)**m)*(x>a)+k*((-x-a)**m)*(x<-a)
    return Results


def F13(X):
    dim=X.shape[0]
    Results=0.1*((np.sin(3*np.pi*X[0]))**2+np.sum((X[0:dim-1]-1)**2*(1+(np.sin(3*np.pi*X[1:dim]))**2))+\
                 ((X[dim-1]-1)**2)*(1+(np.sin(2*np.pi*X[dim-1]))**2))+np.sum(Ufun(X,5,100,4))

    return Results

def F13Plot():
    fig = plt.figure(1) #定义figure
    ax = Axes3D(fig) #将figure变为3d
    x1=np.arange(-50,50,1) #定义x1，范围为[-50,50],间隔为1
    x2=np.arange(-50,50,1) #定义x2，范围为[-50,50],间隔为1
    X1,X2=np.meshgrid(x1,x2) #生成网格
    nSize = x1.shape[0]
    Z=np.zeros([nSize,nSize])
    for i in range(nSize):
        for j in range(nSize):
            X=[X1[i,j],X2[i,j]] #构造F13输入
            X=np.array(X) #将格式由list转换为array
            Z[i,j]=F13(X)  #计算F13的值
    #绘制3D曲面
    # rstride:行之间的跨度  cstride:列之间的跨度
    # rstride:行之间的跨度  cstride:列之间的跨度
    # cmap参数可以控制三维曲面的颜色组合
    ax.plot_surface(X1, X2, Z, rstride = 1, cstride = 1, cmap = plt.get_cmap('rainbow'))
    ax.contour(X1, X2, Z, zdir='z', offset=0)#绘制等高线
    ax.set_xlabel('X1')#x轴说明
    ax.set_ylabel('X2')#y轴说明
    ax.set_zlabel('Z')#z轴说明
    ax.set_title('F13_space')
    plt.show()

F13Plot()