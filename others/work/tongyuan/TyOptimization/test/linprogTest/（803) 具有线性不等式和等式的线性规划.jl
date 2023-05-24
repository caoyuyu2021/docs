using Test
using TyOptimization

@testset "（803）具有线性不等式和等式的线性规划.jl" begin

    #MATLAB软件的解
    xm = [1.0, -1.0, -0.8613, -1.0, -1.0, 0.7462]

    c4 = [
        -0.70711 0.35355 -0.35355 0.70711 0.35355 -0.35355
        -0.70711 0.70711 0.70711 -0.70711 -0.70711 -0.70711
        0 0.61237 0.61237 0 0.61237 0.61237
    ]

    a1 = 0.5
    b1 = 0.5
    C = [
        cos(b1)*cos(a1) cos(b1)*sin(a1) sin(b1)
        -sin(a1) cos(a1) 0
        -sin(b1)*cos(a1) -sin(b1)*sin(a1) cos(b1)
    ]

    F = C * c4
    ff = F[1, :]#向量

    Aeq = F[2:3, :]
    beq = [0, 0]
    A = [eye(6); -eye(6)]
    bb = ones(12)


    #执行优化求解函数
    result = linprog(ff, A, bb, Aeq, beq)
    showres(result)

    @test typeof(result) <: OptimizeResult

    for i in 1:length(xm)
        if xm[i] == 0
            @test abs(result.x[i] - xm[i]) < 0.001
        else
            @test abs(result.x[i] - xm[i]) / xm[i] < 0.001
        end
    end
end