typeof(2 + 3) #> Int64
:(2 + 3) #> :(2 + 3)
typeof(:(2 + 3)) #> Expr
exp = :(2 + 3)
names(exp)
#3-element Array{Symbol,1}:
# :head
# :args
# :typ
exp.head #> :call
exp.args #> 3-element Array{Any,1}:  :+ 2 3
exp.typ #> Any
2 + 3 == + (2, 3) #> true

exp2 = :(2 + a * b - c)
exp2.args #> 3-element Array{Any,1}: :- :(2 + a * b) :c
:(2 + a * b).args #> 3-element Array{Any,1}:  :+ 2  :(a * b)
:(a * b).args #> 3-element Array{Any,1}: :* :a :b

x = 5 #> 5
:x #> :x

quote
   a = 42
   b = a^2
   a - b
end
# quote  # none, line 2:
#     a = 42 # line 3:
#     b = a^2 # line 4:
#     a - b
# end
:(a = 42; b = a^2; a - b)
# returns:
# quote
#     a = 42
#     begin
#         b = a^2
#         a - b
#     end
# end

type Expr
  head::Symbol
  args::Array{Any,1}
  typ
end

dump(:(2 + 2))
# Expr
#   head: Symbol call
#   args: Array(Any,(3,))
#     1: Symbol +
#     2: Int64 2
#     3: Int64 2
#   typ: Any

dump(:(2 + a * b - c))
# Expr
#   head: Symbol call
#   args: Array(Any,(3,))
#     1: Symbol -
#     2: Expr
#       head: Symbol call
#       args: Array(Any,(3,))
#         1: Symbol +
#         2: Int64 2
#         3: Expr
#           head: Symbol call
#           args: Array(Any,(3,))
#           typ: Any
#       typ: Any
#     3: Symbol c
#   typ: Any

symbol('\'') #> :'
symbol("'") #> :'