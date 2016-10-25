using Mamba, Distributions

dogs = (Symbol => Any)[:Y => int(readdlm("dogs.wsv")) ];
dogs[:Dogs] = size(dogs[:Y], 1);
dogs[:Trials] = size(dogs[:Y], 2);
dogs[:xa] = mapslices(cumsum, dogs[:Y], 2);
dogs[:xs] = mapslices(x -> [1:25] - x, dogs[:xa], 2);
dogs[:y] = 1 - dogs[:Y][:, 2:25];

model = Model(
  y = Stochastic(2, 
      @modelexpr(Dogs, Trials, alpha, xa, beta, xs,
      Distribution[
        begin
          p = exp(alpha * xa[i,j] + beta * xs[i,j])
          Bernoulli(p)
        end
        for i in 1:Dogs, j in 1:Trials-1]), 
      false),
  alpha = Stochastic(:(Truncated(Flat(), -Inf, -1e-5))),
  A = Logical(@modelexpr(alpha,exp(alpha))),
  beta = Stochastic(:(Truncated(Flat(), -Inf, -1e-5))),
  B = Logical(@modelexpr(beta,exp(beta))) );

inits = [
  [:y => dogs[:y], :alpha => -1, :beta => -1],
  [:y => dogs[:y], :alpha => -2, :beta => -2]
];

scheme = [Slice([:alpha, :beta], [1.0, 1.0])];
setsamplers!(model, scheme);
sim = 
  mcmc(model,dogs,inits,10000,burnin=2500,thin=2, chains=2);

