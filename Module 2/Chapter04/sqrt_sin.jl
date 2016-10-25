trunc(x) = x < 0 ? zero(x) : x
function sqrt_sin(x)
y = trunc(x)
return sin(sqrt(y)+1)
end