# type annotations and scope:
x = 1.0 # x is Float64
x = 1 # now x is Int
# y::Float64 = 1.0 # LoadError: "y is not defined"

function scopetst()
    y::Float64 = 1.0 # y must be Float64, not possible in global scope
    # y = 1
end

# compound expressions:
x = begin
  a = 5
  2 * a
end # after: x = 10
println(a) #=> a = 5
x = (a = 5; 2 * a)

const GC = 6.67e-11 # gravitational constant in m3/kg s2

GC = 3.14 #=> Warning: redefining constant GC
# GC = 10 #=> ERROR: invalid redefinition of constant GC

julia> const ARR = [4,7,1]
julia> ARR[1] = 9
julia> show(ARR) #=> [9,7,1]
julia> ARR = [1, 2, 3] #=> Warning: redefining constant ARR

