[1, 2, 3]
[1 2 3]

matrix = [1 2; 3 4]
matrix[2, 1] #> 3
[1 2] * [3 ; 4]

ma1 = rand(3, 5)
ndims(ma1) #> 2
size(ma1) #> (3, 5)
size(ma1,1) #> 3
size(ma1,2) #> 5
length(ma1) #> 15

idm = eye(3)
idm[1:end, 2] #> 2nd column
idm[2, :] #> 2nd row
idm[2:end, 2:end]
#2x2 Array{Float64,2}:
# 1.0  0.0
# 0.0  1.0
idm[2, :] = 0
#julia> idm
#3x3 Array{Float64,2}:
# 1.0  0.0  0.0
# 0.0  0.0  0.0
# 0.0  0.0  1.0

jarr = (Array{Int64, 1})[]
push!(jarr, [1,2])
push!(jarr, [1,2,3,4])
push!(jarr, [1,2,3])
jarr #>
#3-element Array{Array{Int64,1},1}:
# [1,2]
# [1,2,3,4]
# [1,2,3]

ma = [1 2; 3 4]
ma' #> [1 3; 2 4]
ma * ma' #>
#5    11
#11  25

inv(ma) #> 2x2 Array{Float64,2}:
 # -2.0   1.0
 # 1.5   -0.5

ma * inv(ma) #> 2x2 Array{Float64,2}:
 # 1.0          0.0
 # 8.88178e-16  1.0

v = [1.,2.,3.] #> equivalent to v = [1.0,2.0,3.0]
w = [2.,4.,6.]
append!(v, w)
#6-element Array{Float64,1}:
# 1.0
# 2.0
# 3.0
# 2.0
# 4.0
# 6.0
 v = [1.,2.,3.]
hcat(v,w)
# 3x2 Array{Float64,2}:
#  1.0  2.0
#  2.0  4.0
#  3.0  6.0
vcat(v,w)
# 6-element Array{Float64,1}:
#  1.0
#  2.0
#  3.0
#  2.0
#  4.0
#  6.0
arr = Int64[]
sizehint(arr, 75)