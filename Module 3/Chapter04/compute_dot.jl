function compute_dot(DX::Vector{Float64},DY::Vector{Float64})
assert(length(DX) == length(DY))
n = length(DX)
incx = incy = 1
product = ccall((:ddot, "libLAPACK"),
                 Float64,
                  (Ptr{Int32}, Ptr{Float64}, Ptr{Int32}, 
            Ptr{Float64}, Ptr{Int32}),
                  &n, DX, &incx, DY, &incy)
return product
end
