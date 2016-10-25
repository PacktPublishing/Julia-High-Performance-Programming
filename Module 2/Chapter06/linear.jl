function mysum_linear(a::AbstractArray)
s=zero(eltype(a))
for i = 1:length(a)
s=s+a[i]
end
return s
end