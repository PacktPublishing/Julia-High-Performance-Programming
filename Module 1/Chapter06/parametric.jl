type Point{T}
  x::T
  y::T
end

Point{Int64} #> Point{Int64} (constructor with 1 method)
Point{Float64} #> Point{Float64} (constructor with 1 method)
Point{String} #> Point{String} (constructor with 1 method)

issubtype(Point{Int64}, Point) #> true
issubtype(Point{String}, Point) #> true
issubtype(Point{Float64}, Point{Real}) #> false

p = Point{Int64}(2, 5) #> Point{Int64}(2,5)
p = Point(2, 5) #> Point{Int64}(2,5)
p = Point("London", "Great-Britain") #> Point{String}("London", "Great-Britain")

type PointP{T <: Real}
  x::T
  y::T
end

# p = PointP("London", "Great-Britain") #> ERROR: `PointP{T<:Real}` has no method 
# matching Point{T<:Real}(::ASCIIString, : ASCIIString)

add{T}(x::T, y::T) = x + y
add(2, 3) #> 5
# add(2, 3.0) #> ERROR: `add` has no method matching add(::Int64, ::Float64)
add{T<:Number}(x::T, y::T) = x + y

function vecfloat{T <: FloatingPoint}(x::Vector{T}) 
# code   
end