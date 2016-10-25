using JuMP
N = 6;
m = Model();				# Use default solver
@defVar(m, x[1:N], Bin);		# Define array variable to hold results
profit  =  [ 5, 3, 2, 7, 4, 4 ];	# Profit vector of size N
weight = [ 2, 8, 4, 2, 5, 6 ];		# Weights vector of size 

maxcap = 12;
@setObjective(m, Max, dot(profit, x));
@addConstraint(m, dot(weight, x) <= maxcap);

status = solve(m);			# Solve problem using MIP solver
@printf "Value of the objective is %.1f" getObjectiveValue(m);

println("Solution is:")
for i = 1:N
    print("x[$i] = ", getValue(x[i]));
    println(", p[$i]/w[$i] = ", profit[i]/weight[i]);
end

