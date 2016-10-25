function sum_vectors!(x, y, z)
n = length(x)
for i = 1:n
x[i] = y[i] + z[i]
end
end