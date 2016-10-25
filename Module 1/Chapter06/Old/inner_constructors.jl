type Person
    firstname::String
    lastname::String
    sex::Char
    age::Float64
    children::Array{String, 1}
end

p1 = Person("Alan", "Bates", 'M', 45.5, ["Jeff", "Stephan"])
#> Person("Alan", "Bates",'M',45.5,String["Jeff","Stephan"])

people = Person[] #> 0-element Array{Person,1}
push!(people, p1)
push!(people, Person("Julia", "Smith", 'F', 27, ["Viral"]))

show(people)
#> [Person("Alan", "Bates", 'M',45.5,String["Jeff","Stephan"]),
# Person("Julia", "Smith",'F',27.0,String["Viral"])]

fullname(p::Person) = "$(p.firstname) $(p.lastname)"
fullname(p::Person) = string(p.firstname, " ", p.lastname)
print(fullname(p1)) #> Alan Bates

type Family
     name::String
     members::Array{String, 1}
     big::Bool
     Family(name::String) = new(name, String[], false)
     Family(name::String, members) = new(name, members, length(members) > 4)
end

fam = Family("Bates-Smith", ["Alan", "Julia", "Jeff", "Stephan", "Viral"])
#> Family("Bates-Smith",String["Alan","Julia","Jeff","Stephan","Viral"],true)
