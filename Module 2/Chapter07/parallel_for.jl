function serial_add()
s=0.0
for i = 1:1000000
s=s+randn()
end
return s
end
function parallel_add()
return @parallel (+) for i=1:1000000
randn()
end
end