using Test
using TyMachineLearning

@testset "特征提取" begin
    X = [40 88; 51 88; 35 78; 36 75; 39 72; 44 71; 48 71; 52 74; 55 77]
    Y = [36 43; 48 42; 31 26; 33 28; 37 30; 40 31; 45 30; 48 28; 51 24]
    mtx1, mtx2, d = procrustes(X, Y)
    @test size(mtx1) == (9, 2)
end
