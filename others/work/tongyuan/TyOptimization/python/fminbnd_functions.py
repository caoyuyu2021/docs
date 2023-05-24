from scipy.optimize import minimize_scalar

def fminbnd(fun,bounds=None,args=(),tol=None,maxiter=500,disp=0,xatol=1e-5):

   res = minimize_scalar(fun=fun, bounds=bounds, args=args, method='bounded',tol=tol,
         options={'maxiter':maxiter,'disp':disp,'xatol':xatol})
   res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":"bounded",
          "status":res.status, "nfev":res.nfev}  #,"nit":res.nit
   return res_dict

   
 