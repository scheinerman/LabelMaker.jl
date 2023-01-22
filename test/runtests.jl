using Test, LabelMaker

@testset "Integer Labels" begin
    L = IntLabel()
    @test next!(L) == 0
    @test next!(L) == 1
end

@testset "String Labels" begin 
    L = StringLabel("prefix-",2)
    @test next!(L) == "prefix-00"
    @test next!(L) == "prefix-01"
end