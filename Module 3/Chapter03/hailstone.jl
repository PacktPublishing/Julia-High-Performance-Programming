function hailstone(n)
   k = 1
   a = [n]
   while n > 1 
	   n = (n % 2 == 0) ? n >> 1 : 3n + 1 
	   push!(a,n)
         k += 1
   end
   a
end
