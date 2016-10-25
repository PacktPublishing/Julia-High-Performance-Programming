include("derivative.jl")

function quadratic(f)
    # Compute the first derivative of f
	f1 = derivative(f)
    
    # Get the y intercept (explictly passing a floating point number)
	c = f(0.0)

	# Get the y intercept of the first derivative
	b = f1(0.0)

	a = f(1.0) - b - c
    
    # Our old friend the quadratic formula
    # Notice how Julia lets you return multiple values
    # Multiple values should be separated by a comma and
    # are returned as a tuple
    # return (-b + sqrt(b^2 -4a*c)) / 2a, (-b - sqrt(b^2 -4a*c)) / 2a
	return (-b + sqrt(b^2 -4a*c + 0im)) / 2a, (-b - sqrt(b^2 -4a*c + 0im)) / 2a
end



