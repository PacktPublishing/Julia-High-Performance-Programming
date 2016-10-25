function prod_dim{T, N}(x::Array{T, N})
s = 1
for i = 1:N
s = s * size(x, i)
end
return s
end