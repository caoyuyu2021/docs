using Test

@testset "两级全析因设计" begin
    L = ff2n(2)
    @test size(L) == (4, 2)
end
