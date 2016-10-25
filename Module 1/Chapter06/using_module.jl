require("temperature_converter.jl")

using TemperatureConverter

println("$(as_celsius(100, :Celsius))") #> 100
println("$(as_celsius(100, :Kelvin))") #> 373
# println("$(kelvin_to_celsius(0))") #> ERROR: kelvin_to_celsius not defined