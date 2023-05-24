from scipy.optimize import minimize
from scipy.optimize import linprog
import numpy as np

def linprog2(c, A_ub=None, b_ub=None, A_eq=None, b_eq=None, bounds=None, method='highs', options=None):

   res = linprog(c=c, A_ub=A_ub, b_ub=b_ub, A_eq=A_eq,b_eq=b_eq,bounds=bounds,method=method,
         options=options)

   res_dict={"success":res.success,"x":res.x,"fun":res.fun,"method":method,
          "status":res.status, "nit":res.nit}
   return res_dict