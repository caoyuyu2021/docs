

def ineq_cons(funcs,jacs):
  ineq_cons = {'type': 'ineq',
               'fun' : funcs,
               'jac' : jacs}
  return ineq_cons
  
def ineq_cons2(funcs):
  ineq_cons = {'type': 'ineq',
               'fun' : funcs}
  return ineq_cons

def eq_cons(funcs,jacs):
  eq_cons = {'type': 'eq',
             'fun' : funcs,
             'jac' : jacs}
  return eq_cons
  
def eq_cons2(funcs):
  eq_cons = {'type': 'eq',
             'fun' : funcs}
  return eq_cons