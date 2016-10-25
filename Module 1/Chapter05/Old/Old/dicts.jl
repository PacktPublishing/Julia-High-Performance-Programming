d1 = [1 => 4.2, 2 => 5.3]
d1 = {1 => 4.2, 2 => 5.3}
d2 = {"a"=>1, (2,3)=>true}

d3 = [:A => 100, :B => 200]
d3[:B] #> 200
# d3[:Z] #> ERROR: key not found: :Z
get(d3, :Z, 999) #> 999
in( (:Z, 999), d3) #> false
in( (:A, 100), d3) #> true
d3[:A] = 150 #> d3 is now [:A => 150, :B => 200]
d3[:C] = 300 #> d3 is now [:A => 150, :B => 200, :C => 300]
length(d3) #> 3
# d3["CVO"] = 500 #> ERROR: CVO is not a valid key for type Symbol# 
# d3[:CVO] = "Julia" #> ERROR: `convert` has no method matching     # convert(::Type{Int64}, ::ASCIIString)

d4 = Dict()
d4["lang"] = "Julia"

d5 = Dict{Float64, Int64}()
# d5["c"] = 6 #> ERROR: `convert` has no method matching convert(::Type{Float64}, ::ASCIIString)

d3 = [:A => 100, :B => 200]
delete!(d3, :B) #> Dict{Symbol,Int64} with 1 entry:  :A => 100

d3 = [:A => 100, :B => 200]
ki = keys(d3) #> KeyIterator
for k in ki
   println(k)
end #> A   B
:A in ki #> true
:Z in ki #> false
haskey(d3, :A) #> true
collect(keys(d3)) #>
vi = values(d3) #> ValueIterator
for v in values(d3)
    println(v)
end #> 100  200

keys1 = ["J.S. Bach", "Woody Allan", "Barak Obama"]
values1 = [ 1685, 1935, 1961]
d5 = Dict(keys1, values1)
#>
d5 = [ "J.S. Bach" => 1685,
       "Woody Allan" => 1935,
       "Barak Obama" => 1961 ]
#> Dict{ASCIIString,Int64} with 3 entries:
for (k, v) in d5
  println("$k was born in $v")
end
for p in d5
  println("$(p[1]) was born in $(p[2])")
end
#J.S. Bach was born in 1685
#Barak Obama was born in 1961
#Woody Allan was born in 1935

dpairs = ["a", 1, "b", 2, "c", 3]
d6 = [dpairs[i]=>dpairs[i+1] for i in 1:2:length(dpairs)]
d6 = (String => Int64)[dpairs[i]=>dpairs[i+1] for i in 1:2:length(dpairs)]

# use of a dictionary:
function showfactor(n)
 d = factor(n)
 println("factors for $n")
 for (k, v) in d
     print("$k^$v\t")
 end
end

# neat tricks:
dict = d6
arrkey = [key for (key, value) in dict] #> 3-element Array{Any,1}: "c" "b" "a"
arrval = [value for (key, value) in dict] #> 3-element Array{Any,1}: 3 2 1

dict = d1
n = 1
arrn = [dict[i] for i = 1:n] #> 1-element Array{Any,1}: 4.2
arrn = map((i) -> dict[i], [1:n]) #> 1-element Array{Any,1}: 4.2