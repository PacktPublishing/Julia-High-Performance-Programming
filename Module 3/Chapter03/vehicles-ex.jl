using Vehicles;

malcolm = Contact("Malcolm","malcolm@abc.net","07777555999");
myCar = Ford(malcolm, "Model T", 1000, 50.0);
myBike = Scooter(malcolm, "Vespa", 125, 35.0);

james = Contact("James","james@abc.net","07777666888");
jmCar = BMW(james,"Series 500", 3200, 125.0);
jmBoat = Yacht(james,"Oceanis 44",14.6);
jmBike = MotorBike(james, "Harley", 850, 120.0);

david = Contact("David","dave@abc.net","07777222444");
dvCar = VW(david,"Golf", "diesel", "red", 1800, 85.0);
dvBoat = Speedboat(david,"Sealine","petrol", 600, 45.0, 8.2);


-----------------------

dsBoat.owner

msCar
msCar.owner = david;
msCar

s = [myCar, jmCar, dvCar]
3-element Array{Car,1}:
 Ford(Contact("Malcolm","malcolm@abc.net","07777555999"),"Model T","Petrol","Black",1000,50.0)
 BMW(Contact("James","james@abc.net","07777666888"),"Series 500","Petrol","Blue",3200,125.0)  
 VW(Contact("David","dave@abc.net","07777222444"),"Golf","diesel","red",1800,85.0) 
 
for c in s
    who = c.owner.name
    model = c.make
    println("$who has a $model car")
end
        
s =[jmCar, jmBike, jmBoat]  
for c in s
    who = c.owner.name
    model = c.make
    println("$who has a $model vehicle")
end

print "James owns these vehicles: " 
for c in s
    print("$(s.make) ")
end
println()

Series 500
Oceanis 44