using Test

@testset "中央复合设计" begin
    list_min = [4, 5]
    list_max = [5, 6]
    list_digit = [2, 2]
    list_center = [4, 4]
    c = ccdesign(2, list_min, list_max, list_digit, list_center)
    @test size(c[1]) == (9, 2)
end
