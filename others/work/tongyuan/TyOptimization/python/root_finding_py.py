from scipy.optimize import root
import numpy as np

def fsolve(fun, x0, args=(), method='krylov', jac=None, tol=None, callback=None, options=None):

   res = root(fun=fun,x0=x0,args=args,method=method,jac=jac,tol=tol,callback=callback,options=options)
   res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":method,
          "status":res.status} #, "目标函数求值次数":res.nfev
   return res_dict
   
# def callback_root(x):
#     global niter
#     if niter%10==0:
#         print("迭代次数     求解结果")
#     print("{:>5d}      ".format(niter+1)+str(x))
#     niter=niter+1