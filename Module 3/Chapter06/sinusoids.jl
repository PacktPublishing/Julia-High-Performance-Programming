using Winston
fq = 500.0;
N = 512;
T = 6 / fq;
td = linspace(0, T, N);
x1 = sin(2pi * fq * td);
x2 = cos(8pi * fq * td);
x3 = cos(16pi * fq * td);
x = x1 + 0.4*x2 + 0.2*x3
plot(td, x)
