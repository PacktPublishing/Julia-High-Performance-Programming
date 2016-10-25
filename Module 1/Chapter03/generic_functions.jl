# multiple dispatch:
f(n, m) = "base case"
f(n::Number, m::Number) = "n and m are both numbers"
f(n::Number, m) = "n is a number"
f(n, m::Number) = "m is a number"
f(n::Integer, m::Integer) = "n and m are both integers"
#> f (generic function with 5 methods)
f(1.5, 2) #> "n and m are both numbers"
f(1, "bar") #> "n is a number"
f(1, 2) #> "n and m are both integers"
f("foo", [1,2]) #> "base case"
f(n::Float64, m::Integer) = "n is a float and m is an integer"
#> f (generic function with 6 methods)
f(1.5, 2) #> "n is a float and m is an integer"

# methods:
methods(+)
methods(sort)
methodswith(String)

# measuring execution:
fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)
@time fib(35)
@elapsed fib(35) #> elapsed time: 0.115853481 seconds (45144 bytes allocated)