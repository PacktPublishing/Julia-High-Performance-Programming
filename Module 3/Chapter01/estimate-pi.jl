#
# Estimate-pi.jl
#
sumsq(x,y) = x*x + y*y;

N=1000000; 
x = 0;
for i = 1:N
  if sumsq(rand(), rand()) < 1.0
    x += 1
  end
end
@printf "Estimate of PI for %d trials is %8.5f\n" N 4.0*(x / N);

