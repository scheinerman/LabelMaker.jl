using Test, LabelMaker

@testset "Integer Labels" begin
    L = IntLabel()
    @test next_label!(L) == 0
    @test next_label!(L) == 1
    @test L() == 2

    L = IntLabel(10)
    @test L() == 10
end

@testset "String Labels" begin 
    L = StringLabel("prefix-",2)
    @test next_label!(L) == "prefix-00"
    @test next_label!(L) == "prefix-01"
    @test L() == "prefix-02"
end