using TyMachineLearning
using Test

@testset "使用gmdistribution创建高斯混合分布.jl" begin
    #创建数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    gm = gmdistribution(; n_components=3)
    fgm = gm.fit(fgdata_x)
    @test fgm.aic(fgdata_x) > 0
end
