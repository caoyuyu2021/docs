from scipy.optimize import  root_scalar


def fzero(fun, args=(), method=None, bracket=None, fprime=None, fprime2=None, x0=None, x1=None, xtol=None, rtol=None, maxiter=None):
   
  
   res = root_scalar(f=fun, args=args, method=method,bracket=bracket,fprime=fprime,fprime2=fprime2,x0=x0,x1=x1,xtol=xtol,
                    rtol=rtol, maxiter=maxiter)
   res_dict={"success":res.converged,"x":res.root,"method":method,
             "nit":res.iterations,"nfev":res.function_calls}

   return res_dict

   
 