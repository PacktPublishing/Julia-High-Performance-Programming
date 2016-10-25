function sum_vector(x::AbstractArray)
s = 0.0
for i = 1:length(x)
s = s + x[i]
end
return s
end
function sum_cols_matrix_views(x::Array{Float64, 2})
num_cols = size(x, 2); num_rows = size(x, 1)
s = zeros(num_cols)
for i = 1:num_cols
s[i] = sum_vector(sub(x, 1:num_rows, i))
end
return s
end