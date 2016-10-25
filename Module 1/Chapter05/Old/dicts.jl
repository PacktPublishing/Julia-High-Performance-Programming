d1 = [1 => 4.2, 2 => 5.3] # ok in v0.3-0.4
# d1 = Dict(1 => 4.2, 2 => 5.3) # from v0.4 onwards
d1 = {1 => 4.2, 2 => 5.3} # ok in v0.3-0.4
# d1 = Dict{Any,Any}(1 => 4.2, 2 => 5.3) # from v0.4 onwards
d2 = {"a"=>1, (2,3)=>true} # ok in v0.3-0.4
# d2 = Dict{Any,Any}("a"=>1, (2,3)=>true) # from v0.4 onwards

d3 = [:A => 100, :B => 200]
# d3 = Dict(:A => 100, :B => 200) # from v0.4 onwards
d3[:B] #> 200
# d3[:Z] #> ERROR: key not found: :Z
get(d3, :Z, 999) #> 999
in( (:Z, 999), d3) #> false
(:Z, 999) in d3 #> false
in( (:A, 100), d3) #> true
(:A, 100) in d3  #> true
d3[:A] = 150 #> d3 is now [:A => 150, :B => 200]
d3[:C] = 300 #> d3 is now [:A => 150, :B => 200, :C => 300]
length(d3) #> 3
# d3["CVO"] = 500 #> ERROR: CVO is not a valid key for type Symbol# 
# d3[:CVO] = "Julia" #> ERROR: `convert` has no method matching     # convert(::Type{Int64}, ::ASCIIString)

dmus = [ :first_name => "Louis", :surname => "Armstrong", :occupation => "musician",  
 		 :date_of_birth => "4/8/1901" ]
# dmus = Dict(:first_name => "Louis", :surname => "Armstrong", :occupation => "musician",  
#		 :date_of_birth => "4/8/1901") # from v0.4 onwards

d4 = Dict()
d4["lang"] = "Julia"

d5 = Dict{Float64, Int64}()
# d5["c"] = 6 #> ERROR: `convert` has no method matching convert(::Type{Float64}, ::ASCIIString)

d3 = [:A => 100, :B => 200]
# d3 = Dict(:A => 100, :B => 200) # from v0.4 onwards 
delete!(d3, :B) #> Dict{Symbol,Int64} with 1 entry:  :A => 100

d3 = [:A => 100, :B => 200]
# d3 = Dict(:A => 100, :B => 200) # from v0.4 onwards
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

keys1 = ["J.S. Bach", "Woody Allen", "Barack Obama"]
values1 = [ 1685, 1935, 1961]
d5 = Dict(keys1, values1) # ok in v0.3-0.4
# d5 = Dict(zip(keys1, values1)) # from v0.4 onwards
#>
d5 = [ "J.S. Bach" => 1685, # ok in v0.3-0.4
       "Woody Allen" => 1935,
       "Barack Obama" => 1961 ]
# d5 = Dict("J.S. Bach" => 1685, 
#       "Woody Allen" => 1935,
#       "Barack Obama" => 1961) # from v0.4 onwards
#> Dict{ASCIIString,Int64} with 3 entries:
for (k, v) in d5
  println("$k was born in $v")
end
for p in d5
  println("$(p[1]) was born in $(p[2])")
end
#J.S. Bach was born in 1685
#Barack Obama was born in 1961
#Woody Allen was born in 1935

dpairs = ["a", 1, "b", 2, "c", 3]
d6 = [dpairs[i]=>dpairs[i+1] for i in 1:2:length(dpairs)]
d6 = (String => Int64)[dpairs[i]=>dpairs[i+1] for i in 1:2:length(dpairs)]

capitals = (String => String)["France"=> "Paris", "China"=>"Beijing"]
# capitals = Dict{String, String}("France"=> "Paris", "China"=>"Beijing") # from v0.4 onwards

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
# same as collect(keys(dict)) 
arrval = [value for (key, value) in dict] #> 3-element Array{Any,1}: 3 2 1
# same as collect(values(dict))

dict = d1
n = 1
arrn = [dict[i] for i = 1:n] #> 1-element Array{Any,1}: 4.2
arrn = map((i) -> dict[i], [1:n]) #> 1-element Array{Any,1}: 4.2