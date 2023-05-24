using Test

@testset "拉丁超立方体样本" begin
    list_min = [-1000]
    list_max = [1000]
    list_digit = [1]
    c = lhsdesign(1000, list_min, list_max, list_digit)
    @test size(c) == (1000, 1)
end
