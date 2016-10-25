function trunc(x)
if typeof(x) == Float64
return 0.0
elseif typeof(x) == Float32
return Float32(0.0)
elseif typeof(x) == Int64
return 0
end
end