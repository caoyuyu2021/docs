using Test

@testset "全因子设计" begin
    list_min = [0, 2, 4]
    list_max = [1, 3, 5]
    list_digit = [1, 1, 1]
    c = fullfact(3, list_min, list_max, list_digit)
    @test size(c) == (1000, 3)
end
