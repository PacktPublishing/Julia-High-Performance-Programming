search("Julia","uli") #=> 2:4
typeof(1:1000) #=> UnitRange{Int64}

a = split("A,B,C,D",",")
typeof(a) #=> Array{SubString{ASCIIString},1}
show(a) #=> SubString{ASCIIString}["A","B","C","D"]

arr = [100, 25, 37]
arr[1] #=> 100
arr[end] #=> 37
# arr[6] #=> BoundsError
println(eltype(arr)) #=> Int64
println(length(arr)) #=> 3
println(ndims(arr)) #=> 1
println(size(arr,1)) #=> 3
println(size(arr)) #=> (3,)

arr2 = Array(Int, 5)
show arr2 #=> [0,0,0,0,0]
sizehint(arr2, 10^5)

a = Float64[] #=> 0-element Array{Float64,1}
b = [1:7] #=> 7-element Array{Int64,1}: [1,2,3,4,5,6,7]
join(b, ", ") #=> "1, 2, 3, 4, 5, 6, 7"
matrix = [1 2; 3 4] # => 2x2 Int64 Array: [1 2; 3 4]

b[1:3] # => [1, 2, 3]
b[2:end] # => [2, 3, 4, 5, 6, 7]  , b[2:] is deprecated
c = [100,200,300]
append!(b,c) # Now b is [1, 2, 3, 4, 5, 6, 7, 100, 200, 300]
pop!(b) #=> 300, b is now [1, 2, 3, 4, 5, 6, 7, 100, 200]
push!(b, 42) # b is now [1, 2, 3, 4, 5, 6, 7, 100, 200, 42]
shift!(b) #=> 1, b is now [2, 3, 4, 5, 6, 7, 100, 200, 42]
unshift!(b, 42) # b is now [42, 2, 3, 4, 5, 6, 7, 100, 200, 42]
splice!(b,8) #=> 100, b is now [42, 2, 3, 4, 5, 6, 7, 200, 42]
in(42, b) #=> true
in(43, b) #=> false
sort(b) #=> [2,3,4,5,6,7,42,42,200], b is not changed
sort!(b) #=> b is now changed to [2,3,4,5,6,7,42,42,200]

arr = [1, 5, 3]
# looping
for e in arr
    print("$e ")
end # prints 1 5 3
arr + 2 #=> [3, 7, 5]
arr * 2 #=> [2, 10, 6]

ma1 = rand(3, 5)
ndims(ma1) #=> 2
size(ma1) #=> (3, 5)
size(ma1,1) #=> 3
size(ma1,2) #=> 5
length(ma1) #=> 15

idm = eye(3)
zeros(5)
ones(4)
ones(3, 2)
eqa = linspace(0, 10, 5)
show(eqa) #=> [0.0,2.5,5.0,7.5,10.0]
fill!(arr, 42) #=> [42,42,42]

A = [1,2,4,6]
A0 = A
show(A0)
A[4] = 0
show(A) #=> [1,2,4,0]
show(A0) #=> [1,2,4,0]
