mult(x, y) = x * y
typeof(mult) #=> Function

plustwo = function (x)
              x + 2
          end
plustwo(3) #=> 5

function quadratic(f)
       # calculations (for full code see end of chapter)
    return (-b + sqrt(b^2 -4a*c + 0im)) / 2a, (-b - sqrt(b^2 -4a*c + 0im)) / 2a
end
r1, r2 = quadratic(x -> 2x^2 + 30x + 9)

function derivative(f)
    return function(x)
        # definiton of anonymous function calculating derivative
    end
end

# nested:
function a(x)
    z = x * 2
    function b(z)
        z += 1
    end
    b(z)
end

d = 5
a(d) #=> 11

# closure:
function counter()
    n = 0
    () -> n +=1, () -> n = 0
end
(addOne, reset) = counter()
addOne()
addOne()
addOne()
reset()



# recursive:
sum(n) =  n > 1 ? sum(n-1) + n : n
sum(100) #=> 5050
fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)
fib(1000) #=>

