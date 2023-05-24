#去除ga函数python依赖
from sko.PSO import PSO
# from sko.GA import GA

# 旅行商问题
# from sko.GA import GA_TSP        
# import numpy as np
# from scipy import spatial

def particleswarm(func,n_dim,lb,ub,size_pop=50,max_iter=100,w=0.8,c1=0.5,c2=0.5,constraint_ueq=()):  
    pso = PSO(func=func, n_dim=n_dim, pop=size_pop, max_iter=max_iter, lb=lb, ub=ub, w=w, c1=c1,      
              c2=c2,constraint_ueq=constraint_ueq)   
    pso.run()
    return  pso.best_x, pso.best_y,pso.gbest_y_hist  #历史最优值，最优函数值，最优函数值对应的输入值    

# def ga(func,n_dim,lb,ub,size_pop=50,max_iter=200,prob_mut=0.001, constraint_eq=(),constraint_ueq=(),precision=1e-9):  #等式约束，不等式约束，精准度
#     ga=GA(func=func,n_dim=n_dim,size_pop=size_pop,max_iter=max_iter,prob_mut=prob_mut,lb=lb,ub=ub,constraint_eq=constraint_eq,
#            constraint_ueq=constraint_ueq,precision=precision)
#     ga.run()
#     return ga.best_x, ga.best_y, ga.generation_best_Y

# def ga_tsp(num_points, points_coordinate, start_point, end_point, size_pop, max_iter, prob_mut):
#     num_points = num_points

#     points_coordinate = np.concatenate(
#         [points_coordinate, start_point, end_point])
#     points_coordinate = points_coordinate
#     distance_matrix = spatial.distance.cdist(
#         points_coordinate, points_coordinate, metric='euclidean')

#     def cal_total_distance(routine):
#         '''The objective function. input routine, return total distance.
#         cal_total_distance(np.arange(num_points))
#         '''
#         num_points, = routine.shape
#         # start_point,end_point 本身不参与优化。给一个固定的值，参与计算总路径
#         routine = np.concatenate([[num_points], routine, [num_points + 1]])
#         return sum([distance_matrix[routine[i], routine[i + 1]] for i in range(num_points + 2 - 1)])

#     ga_tsp = GA_TSP(func=cal_total_distance, n_dim=num_points,
#                     size_pop=size_pop, max_iter=max_iter, prob_mut=prob_mut)
#     best_points, best_distance = ga_tsp.run()
#     best_points = best_points+1
#     generation_best_distance = ga_tsp.generation_best_Y

#     return best_points, best_distance, generation_best_distance
  
