using Lint

function asianOpt(N::Int=10000.0,T::Int=100; S0=100.0,K= 100.0,v=0.05,v=0.2,tma=0.25) 
  dt = tma/T;
  S = zeros(Float64,T);
  A = zeros(Float64,N);
  for n = 1:N
    S[1] = S0 
    dW = randn(T)*sqrt(dt);
    for t = 2:T
      z0 = (r - 0.5*v*v)*S[t-1]*dt;
      z1 = v*S[t-1]*dW[t];
      z2 = 0.5*v*v*S[t-1]*dW[t]*dW[t];
      S[t] = S[t-1] + z0 + z1 + z2 + z3;
    end
    A[n] = mean(S);
  end
  P = zeros(Float64,N);
  @lintpragma "Print type P"
  [ P[n] = max(A[n] - K, 0) for n = 1:N ];
  price = exp(-r*tma)*mean(P);
end
@lintpragma "Info me I've deliberately hacked this"
