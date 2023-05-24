from scipy.optimize import least_squares
from scipy.optimize import curve_fit
from scipy.optimize import nnls
from scipy.optimize import lsq_linear
import numpy as np

def lsqnonlin(fun, x0,  lb=None, ub=None,method='trf',ftol=1e-08, xtol=1e-08, gtol=1e-08, x_scale=1.0, loss='linear', f_scale=1.0,
                    max_nfev=None, verbose=0, args=()):
    x0=np.array(x0)

    if type(lb)==type(None) or type(ub)==type(None):
       bounds = ([-np.inf for i in range(len(x0))], [np.inf for i in range(len(x0))]) 
     
    else:
       lb = np.array(lb)
       ub = np.array(ub)
       bounds = ([lb[i] for i in range(len(x0))], [ub[i] for i in range(len(x0))])
 
    res = least_squares(fun, x0, bounds=bounds,method=method,ftol=ftol, xtol=xtol, gtol=gtol, x_scale=x_scale, loss=loss, f_scale=f_scale,
           max_nfev=max_nfev, verbose=verbose, args=args)

    res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":"trf",
          "status":res.status,  "nfev":res.nfev}
    return res_dict   


def lsqcurvefit(f, p0, xdata, ydata, lb=None, ub=None,sigma=None,absolute_sigma=False, 
            check_finite=True,  method=None, jac=None):
    p0 = np.array(p0)
    xdata = np.array(xdata)
    ydata = np.array(ydata)
    if type(lb)==type(None) or type(ub)==type(None):
       bounds = ([-np.inf for i in range(len(p0))], [np.inf for i in range(len(p0))]) 
     
    else:
       lb = np.array(lb)
       ub = np.array(ub)
       bounds = ([lb[i] for i in range(len(p0))], [ub[i] for i in range(len(p0))])
    res = curve_fit(f, xdata, ydata, p0=p0, sigma=sigma, absolute_sigma=absolute_sigma, 
            check_finite=check_finite, bounds=bounds, method=method, jac=jac)
    return res  # return


def lsqnonneg(A, b, maxiter=None):
    res = nnls(A, b, maxiter=maxiter)
    return res     # return


def lsqlin(A, b, lb=None, ub=None,method='trf', tol=1e-10,lsmr_tol=None, max_iter=None, verbose=0):
    A=np.array(A)
    b=np.array(b)
    A_shape=np.shape(A)
    n=A_shape[1]
    if type(lb)==type(None) or type(ub)==type(None):
       bounds = ([-np.inf for i in range(n)], [np.inf for i in range(n)])
    else: 
       lb = np.array(lb)
       ub = np.array(ub)
       bounds = ([lb[i] for i in range(n)], [ub[i] for i in range(n)])
    res = lsq_linear(A, b, bounds=bounds, method=method, tol=tol,lsmr_tol=lsmr_tol, max_iter=max_iter, verbose=verbose)
    res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":"trf",
          "status":res.status,  "nit":res.nit}
    return res_dict
