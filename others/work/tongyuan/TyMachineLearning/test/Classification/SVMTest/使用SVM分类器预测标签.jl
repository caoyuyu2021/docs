using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "使用SVM分类器预测标签.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    #训练模型
    mdl = fitcsvm(fgdata_x, fgdata_y1)
    @test mdl.score(fgdata_x, fgdata_y1) > 0
    @test length(TyMachineLearning.predict(mdl, fgdata_x)) == size(fgdata_x, 1)
end
