function string_zeros(s::AbstractString)
x = Array(s=="Int64"?Int64:Float64, 1_000_000)
for i in 1:length(x)
x[i] = 0
end
return x
end