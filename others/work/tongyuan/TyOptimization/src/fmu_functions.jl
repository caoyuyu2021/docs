function ParaOptFunction_fmu(fmu_path, parameters_name, target_name,sim_time, ncp)   #参数优化
    py"""
    from fmu_functions import ParaOptFunGenerate
    """
    py"ParaOptFunGenerate"(fmu_path, parameters_name, target_name,sim_time, ncp)
end

function constrain_fmu1(fmu_path,parameters_name,observation_name,sim_time,ncp)  
    py"""
    from fmu_functions import *
    """
    py"constrain_fmu1"(fmu_path,parameters_name,observation_name,sim_time,ncp)
end

function constrain_fmu2(fmu_path,parameters_name,observation_name,sim_time,ncp)  
    py"""
    from fmu_functions import *
    """
    py"constrain_fmu2"(fmu_path,parameters_name,observation_name,sim_time,ncp)
end

function callback(x)
    py"""
    from fmincon_functions import *
    """
    py"callback"(x)
end