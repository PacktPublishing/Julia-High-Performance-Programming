# fizzbuzz
for i=1:100
    if mod(i,15)==0     println("FizzBuzz")
    elseif mod(i,5)==0  println("Buzz")
    elseif mod(i,3)==0  println("Fizz")
    else println(i)
    end
end
