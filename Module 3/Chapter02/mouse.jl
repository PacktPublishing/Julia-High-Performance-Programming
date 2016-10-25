#http://en.wikipedia.org/wiki/Stochastic_matrix

I = zeros(4,4);
[I[i,i] = 1 for i in 1:4];

f = open("m3.txt","r")
T = readdlm(f,',');
close(f);

Ep = [0 1 0 0]*inv(I - T)*[1,1,1,1];

println("Expected lifetime for the mouse is $Ep")
