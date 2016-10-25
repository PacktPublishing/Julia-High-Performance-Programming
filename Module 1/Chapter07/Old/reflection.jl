type Person
    name:: String
    height::Float64
end

names(Person) #> 2-element Array{Symbol,1}: :name  :height
Person.types  #> (String,Float64)

code_lowered(+, (Int, Int))
#1-element Array{Any,1}:
# :($(Expr(:lambda, {:x,:y}, {{},{{:x,:Any,0},{:y,:Any,0}},{}}, :(begin  # int.jl
#, line 33:
#        return box(Int64,add_int(unbox(Int64,x),unbox(Int64,y)))
#    end))))

code_typed(+, (Int, Int))
# 1-element Array{Any,1}:
#  :($(Expr(:lambda, {:x,:y}, {{},{{:x,Int64,0},{:y,Int64,0}},{}}, :(begin  # int.
# jl, line 33:
#         return box(Int64,add_int(x::Int64,y::Int64))::Int64
#     end::Int64))))