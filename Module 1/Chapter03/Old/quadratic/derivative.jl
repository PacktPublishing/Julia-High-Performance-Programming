function derivative(fn)
    return function(x)
        # pick a small value for h
        h = x == 0 ? sqrt(eps(Float64)) : sqrt(eps(Float64)) * x
        # floating point arithmetic gymnastics
        xph = x + h
        dx = xph - x
        # evaluate f at x + h
        f1 = fn(xph)
        # evaluate f at x
        f0 = fn(x)
        # divide the difference by h
        # return (fn(xph) - fn(x)) / dx
        return (f1 - f0) / dx
    end

# 1st approximation:
#    return function(x)
#        h = 0.00001
#        f1 = fn(x + h)
#        f0 = fn(x)
#        return (f1 - f0)/h
#    end
end
