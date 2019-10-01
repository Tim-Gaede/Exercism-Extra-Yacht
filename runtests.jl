using Test

include("yacht.jl")



@testset "YACHT valid" begin
    @test Yacht.score([5, 5, 5, 5, 5], Yacht.YACHT) == 50
end

@testset "YACHT invalid" begin
    @test Yacht.score([1, 3, 3, 2, 5], Yacht.YACHT) == 0
end

@testset "ONES valid and ordered" begin
    @test Yacht.score([1, 1, 1, 3, 5], Yacht.ONES) == 3
end

@testset "ONES valid but out of order" begin
    @test Yacht.score([3, 1, 1, 5, 1], Yacht.ONES) ==  3
end

@testset "ONES invalid" begin
    @test Yacht.score([4, 3, 6, 5, 5], Yacht.ONES) ==  0
end

@testset "TWOS" begin
    @test Yacht.score([2, 3, 4, 5, 6], Yacht.TWOS) ==  2
end

@testset "FOURS" begin
    @test Yacht.score([1, 4, 1, 4, 1], Yacht.FOURS) ==  8
end

@testset "THREES" begin
    @test Yacht.score([3, 3, 3, 3, 3], Yacht.THREES) ==  15
end

@testset "FIVES invalid" begin
    @test Yacht.score([3, 3, 3, 3, 3], Yacht.FIVES) ==  0
end

@testset "SIXES" begin
    @test Yacht.score([2, 3, 4, 5, 6], Yacht.SIXES) ==  6
end


@testset "FULL_HOUSE two small three big" begin
    @test Yacht.score([2, 2, 4, 4, 4], Yacht.FULL_HOUSE) ==  16
end

@testset "FULL_HOUSE three small two big" begin
    @test Yacht.score([5, 3, 3, 5, 3], Yacht.FULL_HOUSE) ==  19
end

@testset "FULL_HOUSE with two-pair" begin
    @test Yacht.score([2, 2, 4, 4, 5], Yacht.FULL_HOUSE) ==  0
end

@testset "FULL_HOUSE with four-of-a-kind" begin
    @test Yacht.score([1, 4, 4, 4, 4], Yacht.FULL_HOUSE) ==  0
end

@testset "FULL_HOUSE with yacht" begin
    @test Yacht.score([2, 2, 2, 2, 2], Yacht.FULL_HOUSE) ==  0
end

@testset "FOUR_OF_A_KIND" begin
    @test Yacht.score([6, 6, 4, 6, 6], Yacht.FOUR_OF_A_KIND) ==  24
end

@testset "FOUR_OF_A_KIND with valid five-of-a-kind" begin
    @test Yacht.score([3, 3, 3, 3, 3], Yacht.FOUR_OF_A_KIND) ==  12
end


@testset "FOUR_OF_A_KIND with full house" begin
    @test Yacht.score([3, 3, 3, 5, 5], Yacht.FOUR_OF_A_KIND) ==  0
end

@testset "LITTLE_STRAIGHT" begin
    @test Yacht.score([3, 5, 4, 1, 2], Yacht.LITTLE_STRAIGHT) ==  30
end

@testset "BIG_STRAIGHT" begin
    @test Yacht.score([1, 2, 3, 4, 5], Yacht.BIG_STRAIGHT) ==  0
end

@testset "LITTLE_STRAIGHT with four in a row" begin
    @test Yacht.score([1, 1, 2, 3, 4], Yacht.LITTLE_STRAIGHT) ==  0
end

@testset "LITTLE_STRAIGHT no pairs but invalid" begin
    @test Yacht.score([1, 2, 3, 4, 6], Yacht.LITTLE_STRAIGHT) ==  0
end

@testset "LITTLE_STRAIGHT invalid with 1 and 5 maximum" begin
    @test Yacht.score([1, 1, 3, 4, 5], Yacht.LITTLE_STRAIGHT) ==  0
end

@testset "BIG_STRAIGHT" begin
    @test Yacht.score([4, 6, 2, 5, 3], Yacht.BIG_STRAIGHT) ==  30
end

@testset "LITTLE_STRAIGHT invalid with big straight" begin
    @test Yacht.score([6, 5, 4, 3, 2], Yacht.LITTLE_STRAIGHT) ==  0
end

@testset "BIG_STRAIGHT no pairs but invalid" begin
    @test Yacht.score([6, 5, 4, 3, 1], Yacht.BIG_STRAIGHT) ==  0
end

@testset "CHOICE" begin
    @test Yacht.score([3, 3, 5, 6, 6], Yacht.CHOICE) ==  23
end

@testset "CHOICE with yacht" begin
    @test Yacht.score([2, 2, 2, 2, 2], Yacht.CHOICE) ==  10
end
