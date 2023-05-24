from scipy.optimize import minimize
from scipy.optimize import linprog
import numpy as np

def SLSQP(fun,x0,args=(),jac=None,bounds=None,constraints=(),tol=None,callback=None,maxiter=1000,ftol=1e-06,
          iprint=1,disp=False,eps=1.49e-08,finite_diff_rel_step=None):

   res = minimize(fun=fun, x0=x0, args=args, method='SLSQP',jac=jac, bounds=bounds,constraints=constraints,tol=tol,callback=callback,
         options={'maxiter':maxiter,'ftol':ftol,'iprint': iprint,'disp':disp,'eps':eps,'finite_diff_rel_step':finite_diff_rel_step})
   res_dict={"success":res.success,"x":res.x,"fun":res.fun,"jac":res.jac,"method":"SLSQP",
          "status":res.status, "nit":res.nit, "nfev":res.nfev}
   return res_dict

def Trust_constr(fun,x0,args=(),jac=None,hess=None,hessp=None,bounds=None,constraints=(),tol=None,callback=None,
   xtol=1e-8,gtol=1e-8,barrier_tol=1e-8,sparse_jacobian=None,maxiter=1000,verbose=0,finite_diff_rel_step=None,
   initial_constr_penalty=1.0,initial_tr_radius=1.0,initial_barrier_parameter=0.1,initial_barrier_tolerance=0.1,
   factorization_method=None,disp=False):

   res = minimize(fun=fun, x0=x0, args=args, method='trust-constr',jac=jac,hess=hess,hessp=hessp, bounds=bounds,
      constraints=constraints,tol=tol,callback=callback,options={'xtol':xtol,'gtol':gtol,
      'barrier_tol':barrier_tol,'sparse_jacobian':sparse_jacobian,'maxiter':maxiter,'verbose':verbose,
      'finite_diff_rel_step':finite_diff_rel_step,'initial_constr_penalty':initial_constr_penalty,
      'initial_tr_radius':initial_tr_radius,'initial_barrier_parameter':initial_barrier_parameter,
      'initial_barrier_tolerance':initial_barrier_tolerance,'factorization_method':factorization_method,
      'disp':disp})
   res_dict={"success":res.success,"x":res.x,"fun":res.fun,"grad":res.grad,"method":"trust-constr",
          "status":res.status, "nit":res.nit, "nfev":res.nfev,"execution_time":res.execution_time}

   return res_dict
   
def COBYLA(fun,x0,args=(),constraints=(),tol=None,callback=None,rhobeg=1.0,maxiter=1000,disp=False,catol=0.0002):

   res = minimize(fun=fun, x0=x0, args=args, method='COBYLA',constraints=constraints,tol=tol,callback=callback,
         options={'rhobeg':rhobeg,'maxiter':maxiter,'disp':disp,'catol':catol})
   res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":"COBYLA",
          "status":res.status, "nfev":res.nfev}

   return res_dict

def NelderMead(fun,x0,args=(),bounds=None,tol=None,callback=None,maxiter=None,maxfev=None,disp=False,return_all=False,initial_simplex=None,
      xatol=1e-5,fatol=1e-5,adaptive=False):

   res = minimize(fun=fun, x0=x0, args=args, method='Nelder-Mead', bounds=bounds,tol=tol,callback=callback,
   options={'maxiter':maxiter,'maxfev':maxfev,'disp':disp,'return_all':return_all,'initial_simplex':initial_simplex,
   'xatol': xatol, 'fatol': fatol,'adaptive': adaptive})
   if return_all:
      print("iteration times            result")
      for i,j in enumerate(res.allvecs):
         print(i+1,"                ",j)
      res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":"Powell",
          "status":res.status, "nit":res.nit, "nfev":res.nfev,"allvecs":res.allvecs}
   else:
      res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":'Nelder-Mead',
          "status":res.status, "nit":res.nit, "nfev":res.nfev}
   return res_dict

def Powell(fun,x0,args=(),bounds=None,tol=None,callback=None,maxiter=None,xtol=0.00001,ftol=0.00001,maxfev=None,direc=None,return_all=False,
          disp=False):
 
   res = minimize(fun=fun, x0=x0, args=args, method='Powell', bounds=bounds,tol=tol,callback=callback,
         options={'maxiter':maxiter,'ftol':ftol,'disp':disp,'xtol':xtol,'maxfev':maxfev,'direc':direc, 'return_all': return_all})
   if return_all:
      print("iteration times            result")
      for i,j in enumerate(res.allvecs):
         print(i+1,"                ",j)
      
      res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":"Powell",
          "status":res.status, "nit":res.nit, "nfev":res.nfev,"allvecs":res.allvecs}
   else:
       res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":"Powell",
          "status":res.status, "nit":res.nit, "nfev":res.nfev}
   return res_dict

def LBFGSB(fun,x0,args=(),jac=None,bounds=None,tol=None,callback=None,maxiter=15000,maxcor=10,ftol=2.220446049250313e-09,
          gtol=1e-05,eps=1e-08,iprint=-1,disp=False,maxfun=15000,maxls=20,finite_diff_rel_step=None):
 
   res = minimize(fun=fun, x0=x0, args=args, method='L-BFGS-B',jac=jac, bounds=bounds,tol=tol,callback=callback,
         options={'maxiter':maxiter,'maxcor':maxcor,'ftol':ftol,'gtol':gtol,'iprint': iprint,'disp':disp,
         'eps':eps,'maxfun':maxfun,'maxls':maxls,'finite_diff_rel_step':finite_diff_rel_step})
   res_dict={"success":res.success,"x":res.x,"fun":res.fun,"jac":res.jac,"method":"L-BFGS-B",
          "status":res.status, "nit":res.nit, "nfev":res.nfev}
   return res_dict

def trust_krylov(fun,x0,args=(),jac=None,hess=None,hessp=None,tol=None,callback=None,maxiter=None,initial_trust_radius=1.0,max_trust_radius=1000.0,eta=0.15,
                 gtol=0.00001,inexact=True,return_all=False,disp=False):
  
   res = minimize(fun=fun, x0=x0, args=args, method='trust-krylov', jac=jac,hess=hess,hessp=hessp,tol=tol,callback=callback,
         options={'maxiter':maxiter,'gtol':gtol,'disp':disp,'xtol':xtol,'initial_trust_radius':initial_trust_radius,'max_trust_radius':max_trust_radius, 
         'return_all': return_all,'eta':eta,'inexact':inexact})
   if return_all:
      print("iteration times            result")
      for i,j in enumerate(res.allvecs):
         print(i+1,"                ",j)
      res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":"trust-krylov",
          "status":res.status, "nit":res.nit, "nfev":res.nfev,"allvecs":res.allvecs}
   else:
      res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":"trust-krylov",
          "status":res.status, "nit":res.nit, "nfev":res.nfev}
   return res_dict


# def callback(x):
#     global niter
#     if niter%10==0:
#         print("迭代次数     优化结果")
#     print("{:>5d}      ".format(niter+1)+str(x))
#     niter=niter+1
   
 