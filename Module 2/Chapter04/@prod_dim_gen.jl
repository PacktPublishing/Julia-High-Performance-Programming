function prod_dim_gen_impl{T, N}(x::Array{T, N})
ex = :(1)
for i = 1:N
ex = :(size(x, $i) * $ex)
end
return ex
end