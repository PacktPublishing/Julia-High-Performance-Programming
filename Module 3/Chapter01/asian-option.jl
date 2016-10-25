#
# asian-option.jl
#
function run-asian(N = 100000, PutCall = 'C';) 
# European Asian option.  
# Uses geometric or arithmetic average.
# Euler and Milstein discretization for Black-Scholes.
# Option features.
  println("Setting option parameters");
  S0  = 100;      # Spot price
  K   = 100;      # Strike price
  r   = 0.05;     # Risk free rate
  q   = 0.0;      # Dividend yield
  v   = 0.2;      # Volatility
  tma = 0.25;     # Time to maturity

  Averaging = 'A';  # 'A'rithmetic or 'G'eometric
  OptType = (PutCall == 'C' ? "CALL" : "PUT");
  println("Option type is $OptType");
# Simulation settings.
  println("Setting simulation parameters");
  T = 100;         # Number of time steps
  dt = tma/T;      # Time increment

# Initialize the terminal stock price matrices
# for the Euler and Milstein discretization schemes.
 S = zeros(Float64,N,T);
  for n=1:N
    	S[n,1] = S0;
  end

# Simulate the stock price under the Euler and Milstein schemes.
# Take average of terminal stock price.
  println("Looping $N times.");
  A = zeros(Float64,N);
  for n=1:N
    	for t=2:T
      		dW = (randn(1)[1])*sqrt(dt);
     		 z0 = (r - q - 0.5*v*v)*S[n,t-1]*dt;
     		 z1 = v*S[n,t-1]*dW;
      		z2 = 0.5*v*v*S[n,t-1]*dW*dW;
      		S[n,t] = S[n,t-1] + z0 + z1 + z2;
   	 end
   	 if cmp(Averaging,'A') == 0
      		A[n] = mean(S[n,:]);
   	 elseif cmp(Averaging,'G') == 0
      		A[n] = exp(mean(log(S[n,:])));
   	 end
  end

# Define the payoff
  P = zeros(Float64,N);
  if cmp(PutCall,'C') == 0
    	for n = 1:N
      		P[n] = max(A[n] - K, 0);
  	  end
  elseif cmp(PutCall,'P') == 0
    	for n = 1:N
     		 P[n] = max(K - A[n], 0);
   	 end
  end
# Calculate the price of the Asian option
 AsianPrice = exp(-r*tma)*mean(P);
 @printf "Price: %10.4f\n" AsianPrice;
end

run-asian()

