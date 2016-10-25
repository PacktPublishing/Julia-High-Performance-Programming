function sum_diff(x)
n = length(x); d = 1/(n-1)
s = zero(eltype(x))
s = s + (x[2] - x[1]) / d
for i = 2:length(x)-1
s = s + (x[i+1] - x[i+1]) / (2*d)
end
s = s + (x[n] - x[n-1])/d
end
function sum_diff_fast(x)
n=length(x); d = 1/(n-1)
s = zero(eltype(x))
@fastmath s = s + (x[2] - x[1]) / d
@fastmath for i = 2:n-1
s = s + (x[i+1] - x[i+1]) / (2*d)
end
@fastmath s = s + (x[n] - x[n-1])/d
end