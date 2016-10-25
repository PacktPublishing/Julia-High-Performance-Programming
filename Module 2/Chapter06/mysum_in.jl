function mysum_in(a::AbstractArray)
s = zero(eltype(a))
for i in a
s = s + i
end
end