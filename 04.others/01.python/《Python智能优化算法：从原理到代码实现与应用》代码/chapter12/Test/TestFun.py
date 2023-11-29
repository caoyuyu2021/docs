import numpy as np

def F1(X):
    Results=np.sum(X**2)
    return Results

def F2(X):
    Results=np.sum(np.abs(X))+np.prod(np.abs(X))
    return Results

def F3(X):
    dim=X.shape[0]
    Results=0
    for i in range(dim):
        Results=Results+np.sum(X[0:i+1])**2

    return Results

def F4(X):
    Results=np.max(np.abs(X))

    return Results
    
def F5(X):
    dim=X.shape[0]
    Results=np.sum(100*(X[1:dim]-(X[0:dim-1]**2))**2+(X[0:dim-1]-1)**2)

    return Results
    
def F6(X):
    Results=np.sum(np.abs(X+0.5)**2)

    return Results

def F7(X):
    dim = X.shape[0]
    Temp = np.arange(1,dim+1,1)
    Results=np.sum(Temp*(X**4))+np.random.random()

    return Results
    
def F8(X):
    
    Results=np.sum(-X*np.sin(np.sqrt(np.abs(X))))

    return Results