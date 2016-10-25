function string_zeros_stable(s::AbstractString)
x = Array(s=="Int64"?Int64:Float64, 1_000_000)
return fill_zeros(x)
end
function fill_zeros(x)
for i in 1:length(x)
x[i] = 0
end
return x
end