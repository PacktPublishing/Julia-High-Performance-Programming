#
# asian-winstonplot.jl
#
# Note:
#
# With OSX I have had some problems using the Pango as part of the Winston package
# to display titles and text etc.
#
# This seems to be a problem with Homebrew and the following worked for me
# It only needs to be run once,
# 
# using Homebrew 
# Homebrew.update() 
# Homebrew.rm("pango")
# Homebrew.add("pango") 
#

import Winston;
wn = Winston;

S0  = 100;      # Spot price
K   = 102;      # Strike price
r   = 0.05;     # Risk free rate
q   = 0.0;      # Dividend yield
v   = 0.2;      # Volatility
tma = 0.25;     # Time to maturity
T = 100;        # Number of time steps
dt = tma/T;     # Time increment
S = zeros(Float64,T)
S[1] = S0;	

dW = randn(T)*sqrt(dt);
[ S[t] = S[t-1] * (1 + (r - q - 0.5*v*v)*dt + v*dW[t] + 0.5*v*v*dW[t]*dW[t]) for t=2:T ]
x = linspace(1, T, T);
p = wn.FramedPlot(title = "Random Walk, drift 5%, volatility 20%")
wn.add(p, wn.Curve(x,S,color="red"))
wn.display(p)

