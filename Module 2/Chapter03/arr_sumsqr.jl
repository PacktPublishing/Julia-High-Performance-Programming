function arr_sumsqr{T <: Number}(x::Array{T})
r = zero(T)
for i = 1:length(x)
r = r + x[i] ^ 2
end
return r
end