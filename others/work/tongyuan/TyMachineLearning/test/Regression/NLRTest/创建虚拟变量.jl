using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "创建虚拟变量" begin
    data = Dict("color" => ["red", "blue", "green", "red", "blue", "green"])
    res = dummyvar(data)
    @test size(res) == (6,)
end
