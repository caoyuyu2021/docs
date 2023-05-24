using Test
using CSV
using DataFrames
using PyCall

@testset "弗里德曼试验.jl" begin
    #导入数据
    data2 = [
        5.5000 4.5000 3.5000
        5.5000 4.5000 4.0000
        6.0000 4.0000 3.0000
        6.5000 5.0000 4.0000
        7.0000 5.5000 5.0000
        7.0000 5.0000 4.5000
    ]
    #划分数据
    A2 = data2[:, 1]
    B2 = data2[:, 2]
    C2 = data2[:, 3]
    res = friedman(A2', B2', C2')
    @test res[1] > 0
end
