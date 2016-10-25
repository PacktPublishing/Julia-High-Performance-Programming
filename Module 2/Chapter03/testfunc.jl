foo(x::Integer) = "an integer" #Declare type of function argument
foo(x::ASCIIString) = "a string"
function bar(a, b)
x::Int64 = 0 #Declare type of local variable
y = a+b #Type of variable will be inferred
return y
end