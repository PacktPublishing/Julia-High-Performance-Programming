# maps:
map((x) -> x * 10, [1, 2, 3]) #=> [10, 20, 30]
map(*, [1, 2, 3], [4, 5, 6]) #=> [4, 10, 18]
cubes = map((x)-> x*x*x, [1:5]) #=> [1, 8, 27, 64, 125]

# do block:
map( x-> begin
           if x == 0 return 0
           elseif iseven(x) return 2
           elseif isodd(x) return 1
           end
         end,
    [-3:3]) #=> [1,2,1,0,1,2,1]

map([-3:3]) do x
    if x == 0 return 0
    elseif iseven(x) return 2
    elseif isodd(x) return 1
    end
end #=> [1,2,1,0,1,2,1]

# filter:
filter( n -> iseven(n), [1:10]) #=> [2, 4, 6, 8, 10]
filter( (n) -> n % 2 == 0, [1:10]) #=> [2, 4, 6, 8, 10]

# comprehensions:
arr = [n for n in 1:1000] #=> [1,2,...,1000]
arr2 = Float64[x^2 for x in 1:4] #=> [1.0,4.0,9.0,16.0]
cubes = [x*x*x for x in [1:5]] #=> [1, 8, 27, 64, 125]
table10 = [x*y for x=1:10, y=1:10] #=>
#=
#1   2   3   4   5   6   7   8   9   10
#2   4   6   8  10  12  14  16  18   20
#3   6   9  12  15  18  21  24  27   30
#4   8  12  16  20  24  28  32  36   40
#5  10  15  20  25  30  35  40  45   50
#6  12  18  24  30  36  42  48  54   60
#7  14  21  28  35  42  49  56  63   70
#8  16  24  32  40  48  56  64  72   80
#9  18  27  36  45  54  63  72  81   90
#10  20  30  40  50  60  70  80  90  100
=#
mat1 = [x + y for x in 1:2, y in 1:3]
#=> 2  3  4
#=> 3  4  5

arrany = { i * 2 for i = 1:5 } #=> [2,4,6,8,10]
