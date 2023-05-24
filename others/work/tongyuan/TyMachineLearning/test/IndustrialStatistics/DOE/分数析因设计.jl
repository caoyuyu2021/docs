using Test

@testset "分数析因设计" begin
    list_min = [0, 2, 4, 6]
    list_max = [1, 3, 5, 7]
    list_digit = [1, 1, 1, 1]
    n = 4
    m = 50
    c = fracfact(n, list_min, list_max, list_digit, m)
    @test size(c) == (50, 4)
end
