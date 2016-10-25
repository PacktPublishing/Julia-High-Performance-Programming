for i in 1:2:9
     println(i)
end #> 1 3 5 7 9

search("Julia","uli") #> 2:4
typeof(1:1000) #> UnitRange{Int64}

a = split("A,B,C,D",",")
typeof(a) #> Array{SubString{ASCIIString},1}
show(a) #> SubString{ASCIIString}["A","B","C","D"]

arr = [100, 25, 37]
arra = Any[100, 25, "ABC"] #> element type Any
arr[1] #> 100
arr[end] #> 37
# arr[6] #> BoundsError
println(eltype(arr)) #> Int64
println(length(arr)) #> 3
println(ndims(arr)) #> 1
println(size(arr,1)) #> 3
println(size(arr)) #> (3,)

arr2 = Array(Int64,5)
show(arr2) #> [0,0,0,0,0]
sizehint(arr2, 10^5)

arr3 = Float64[] #> 0-element Array{Float64,1}
push!(arr3, 1.0) #> 1-element Array{Float64,1}
arr4 = [1:7] #> 7-element Array{Int64,1}: [1,2,3,4,5,6,7]
join(arr4, ", ") #> "1, 2, 3, 4, 5, 6, 7"
arr4[1:3] # => [1, 2, 3]
arr4[2:end] # => [2, 3, 4, 5, 6, 7]  , b[2:] is deprecated

b = [1:7]
c = [100,200,300]
append!(b,c) # Now b is [1, 2, 3, 4, 5, 6, 7, 100, 200, 300]
pop!(b) #> 300, b is now [1, 2, 3, 4, 5, 6, 7, 100, 200]
push!(b, 42) # b is now [1, 2, 3, 4, 5, 6, 7, 100, 200, 42]
shift!(b) #> 1, b is now [2, 3, 4, 5, 6, 7, 100, 200, 42]
unshift!(b, 42) # b is now [42, 2, 3, 4, 5, 6, 7, 100, 200, 42]
splice!(b,8) #> 100, b is now [42, 2, 3, 4, 5, 6, 7, 200, 42]
in(42, b) #> true
in(43, b) #> false
println()
println("sorting:")
sort(b) #> [2,3,4,5,6,7,42,42,200], b is not changed
println(b) #> [42,2,3,4,5,6,7,200,42]
sort!(b) #> b is now changed to [2,3,4,5,6,7,42,42,200]
println(b) #> [2,3,4,5,6,7,42,42,200]
println()
arr = [1, 5, 3]
# looping
for e in arr
    print("$e ")
end # prints 1 5 3
arr + 2 #> [3, 7, 5]
arr * 2 #> [2, 10, 6]

a1 = [1, 2, 3]
a2 = [4, 5, 6]
a1 .* a2 #> [4, 10, 18]
dot(a1, a2) #> 32

arr = [1,2,3,4,5]
arr[2:4] = [8,9,10]
println(arr) #> 1 8 9 10 5

zeros(5)
ones(4)
ones(3, 2)
eqa = linspace(0, 10, 5)
println()
show(eqa) #> [0.0,2.5,5.0,7.5,10.0]
fill!(arr, 42) #> [42,42,42]
println()
println(cell(4)) #> {#undef,#undef,#undef,#undef}

v1 = rand(Int32, 5)
println(v1) #> Int32[1735276173,972339632,1303377282,1493859467,-788555652]
int64(v1) #> converts elements to 64 bit integers

a = [1,2,4,6]
a1 = a
show(a1)
a[4] = 0
show(a) #> [1,2,4,0]
show(a1) #> [1,2,4,0]
b = copy(a)
b = deepcopy(a)

a = [1,2,3]
function change_array(arr)
	arr[2] = 25
end
change_array(a)
println(a) #>[ 1, 25, 3]

# the splat operator:
arr = ['a', 'b', 'c']
show(join(arr)) #> "abc"
show(utf32(arr)) #> "abc"
show(string(arr)) #> "['a', 'b', 'c']" 
show(string(arr...)) #> "abc"