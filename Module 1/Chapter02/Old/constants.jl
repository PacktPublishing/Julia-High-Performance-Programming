const GC = 6.67e-11 # gravitational constant in m3/kg s2

GC = 3.14 #=> Warning: redefining constant GC
GC = 10 #=> ERROR: invalid redefinition of constant GC

julia> const ARR = [4,7,1]
julia> ARR[1] = 9
julia> show(ARR) #=> [9,7,1]
julia> ARR = [1, 2, 3] #=> Warning: redefining constant ARR

