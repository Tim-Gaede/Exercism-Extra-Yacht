using Test

include("space_age.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v1.2.0


@testset "Mercury" begin
    @test SpaceAge.on_mercury(2_134_835_688) ==  280.88
end

@testset "Venus" begin
    @test SpaceAge.on_venus(189_839_836) ==  9.78
end

@testset "Earth" begin
    @test SpaceAge.on_earth(1_000_000_000) ==  31.69
end

@testset "Mars" begin
    @test SpaceAge.on_mars(2_129_871_239) ==  35.88
end


@testset "Jupiter" begin
    @test SpaceAge.on_jupiter(901_876_382) ==  2.41
end

@testset "Saturn" begin
    @test SpaceAge.on_saturn(2_000_000_000) ==  2.15
end

@testset "Uranus" begin
    @test SpaceAge.on_uranus(1_210_123_456) ==  0.46
end

@testset "Neptune" begin
    @test SpaceAge.on_neptune(1_821_023_456) ==  0.35
end
