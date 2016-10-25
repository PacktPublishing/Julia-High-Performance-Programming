using Winston

p = FramedPlot(aspect_ratio=1,xrange=(0,100),yrange=(0,100));
n = 21;
x = linspace(0, 100, n);

# Create a set of random variates
yA = 40 .+ 10*randn(n);  
yB = x  .+ 5*randn(n);

# Set labels and symbol styles
a = Points(x, yA, kind="circle"); 
setattr(a,label="a points");
b = Points(x, yB); 
setattr(b,label="b points");
style(b, kind="filled circle");

# Plot a line which ‘fits’ through the yB points
# and add a legend in the top LHS part of the graph
s = Slope(1, (0,0), kind="dotted");
setattr(s, label="slope");

lg = Legend(.1, .9, {a,b,s});
add(p, s, a, b, lg);
savefig("fig 7-4.png")l
display(p)

