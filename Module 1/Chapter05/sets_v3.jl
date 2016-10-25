s = Set({11, 14, 13, 7, 14, 11})
# s = Set(11, 14, 13, 7, 14, 11) #> deprecated!!! works still in v0.3
#> Set{Int64}({7,14,13,11})
# better:
s1 = Set({11, 25})
s2 = Set({25, 3.14})
union(s1, s2) #> Set{Any}({3.14,25,11})
intersect(s1, s2) #> Set{Any}({25})
setdiff(s1, s2) #> Set{Any}({11})
setdiff(s2, s1) #> Set{Any}({ 3.14})
issubset(s1, s2) #> false
issubset(s1, Set({11, 25, 36})) #> true

push!(s1, 32) #> Set{Any}({25,32,11})
in(32, s1) #> true
in(100, s1) #> false

x = Set([1:100])
@time 2 in x # elapsed time 4.888e-6 seconds
x2 = Set([1:1000000])
@time 2 in x2 # elapsed time 5.378e-6 seconds

st = Set{(Int, Int)}()
push!(st, (1,2))
#> Set{(Int64,Int64)}({(1,2)})
st2 = Set({(1, 2), (5, 6)}) #> Set{Any}({(1,2),(5,6)})