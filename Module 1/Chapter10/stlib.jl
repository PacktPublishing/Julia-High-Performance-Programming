filter(x -> iseven(x), 1:10)
# 5-element Array{Int64,1}:
#   2
#   4
#   6
#   8
#  10
mapreduce(x -> sqrt(x), +, 1:10) #> 22.4682781862041
# equivalent to:
sum(map(x -> sqrt(x), [1:10])) #> 22.4682781862041
#
1:10 |> x -> sqrt(x) |> sum #> 22.4682781862041
1:10 |> sqrt |> sum #> 22.4682781862041
1:5 |> exp |> sum #> 233.2041839862982

# clipboard:
a = 42 #> 42
clipboard(a)
workspace()
# a #> ERROR: a not defined
a = clipboard() #> "42"