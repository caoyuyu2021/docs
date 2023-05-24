using Test: Test
using MLJBase
using TyMachineLearning

Test.@testset "识别交叉验证分区中的测试索引.jl" begin
    #设定需要分区的数据列表
    s = collect(1:10)
    Test.@test typeof(s) == Vector{Int64}
    #进行交叉验证分区，其中70%为训练样本，30%为测试样本，即c[1]==train, c[2]==test
    c = partition(s, 0.7; shuffle=true) #c[1]==train, c[2]==test
    #返回测试集观察的索引，值为 1 表示相应的观测值在测试集中，值为 0 表示对应的观测值在训练集中
    res = test(c)
    Test.@test length(res) == length(s)
end
