# n = mult(3, 4) #=> ErrorException("mult not defined"))
function mult(x, y)
    println("x is $x and y is $y")
    x * y
end

n = mult(3, 4) #=> 12
# one-line assignment syntax:
mult(x, y) = x * y
f(x,y) = x^3-y+x*y
println(f(3,2) ) # 31

function mult(x, y)
    println("x is $x and y is $y")
    if x == 1 return y end
    x * y
end

function mult(x::Float64, y::Float64)
    println("x is $x and y is $y")
    x * y
end
# following gives error:
# mult(5, 6)
# ERROR: `mult` has no method matching mult(::Int64, ::Int64)

function multi(n,m)
    n*m, div(n,m), n%m
end
x, y, z = multi(8, 2)

function varargs(n, m, args...)
    println("arguments: $n $m $args")
end
varargs(1, 2, 3, 4) # n is 1, m is 2, and args has value (3, 4)

x = (3, 4)
varargs2(1, 2, x...) # args is (1,2,3,4)
x = [10, 11, 12]
varargs2(1, 2, x...) # args is (1,2,10,11,12)
varargs2(k1="name1", k2="name2, k3=7)

apply(mult, 3, 4) #=> 12

∑(x,y) = x + y
∑(3, 4) #=> 7

# anonymous functions:
function (x)
    x + 2
end

g = (x, y) -> x^3-y+x*y
println(g(3,2) ) # 31

x -> x + 2
() -> x * 5

3+4 #=> 7
+(3,4) #=> 7

m = mult
m(6, 6) #=> 36
