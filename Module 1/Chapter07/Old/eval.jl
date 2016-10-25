exp = Expr(:call, *, 3, 4) #> :((*)(3,4))
eval(exp) #> 12

# exp = Expr(:call, *, 3, a) #> ERROR: a not defined
exp = Expr(:call, *, 3, :a) #> :((*)(3,a))
# eval(exp) #> ERROR: a not defined
a = 4 #> 4
eval(exp) #> 12

# b #> ERROR: b not defined
exp = :(b = 1)
eval(exp) #> 1
b #> 1

exp1 = :(a + b) #> :(a + b)
exp2 = :($a + b) #> :(4 + b)
eval(exp1) #> 5
eval(exp2) #> 5