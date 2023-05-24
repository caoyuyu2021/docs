using Test
using TyMachineLearning
using CSV
using DataFrames
# using LIBSVM

@testset "训练SVM分类器.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    #训练模型
    mdl = fitcsvm(fgdata_x, fgdata_y1)
    @test mdl.score(fgdata_x, fgdata_y1) > 0
end
