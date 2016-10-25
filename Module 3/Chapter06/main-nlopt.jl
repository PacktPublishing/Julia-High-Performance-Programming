using NLopt
count = 0;
function myfunc(x::Vector, grad::Vector)
    if length(grad) > 0
         grad[1] = 0
         grad[2] = 0.5/sqrt(x[2])
    end
    global count;
    count::Int += 1;
    sqrt(x[2]);
end

function mycons(x::Vector, grad::Vector, a, b)
    if length(grad) > 0
        grad[1] = 3*a * (a*x[1] + b)^2
        grad[2] = -1
    end
    (a*x[1] + b)^3 - x[2]
end

opt = Opt(:LD_MMA, 2);
lower_bounds!(opt, [-Inf, 0.]);
xtol_rel!(opt,1e-4);
min_objective!(opt, myfunc);

inequality_constraint!(opt, (x,g) -> mycons(x,g,2,0), 1e-8);
inequality_constraint!(opt, (x,g) -> mycons(x,g,-1,1), 1e-8);

(minf,minx,ret) = optimize(opt, [1.2, 5.6]);
@printf "Ans => %6.3f at (%6.3f,%6.3f)" minf minx[1] minx[2];

