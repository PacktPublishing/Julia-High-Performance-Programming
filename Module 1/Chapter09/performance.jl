# TIPS:
# 1
const DEFAULT = 42

global x = 42
function f(args)
	#function body
end
y = f(x::Int + 1)

# 9
function with_keyword(x; name::String = "Smith")
   # ...
end

# 16
type Person
	name::String
	height::Float64
	weight::Float64
end
# instead of:
# type Person
# 	name
# 	height
# 	weight
# end

# 18
# Use
file = open("file2.txt", "w")
a = "Julia"
b = "Rust"
write(file, a, " ", b)
# instead of:
write(file, "$a $b")

# TOOLS:
# @time

# linter:
Pkg.add("Lint")
using Lint
lintfile("performance.jl")
# 
# typechecker:
Pkg.add("TypeCheck")
using TypeCheck
foo1(x::Int) = isprime(x) ? x: false
checkreturntypes(foo1) #> foo1(Int64)::Union(Bool,Int64)