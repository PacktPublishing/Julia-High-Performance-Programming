function mysum_eachindex(a::AbstractArray)
s = zero(eltype(a))
for i in eachindex(a)
s = s + a[i]
end
end