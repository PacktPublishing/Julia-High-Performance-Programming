using PyPlot

xkcd()
fig = figure(figsize=(10,5))
ax = axes()

x = linspace(1,10,101)
y = sin(3x + cos(5x))
p = plot(x,y)

ax[:set_xlim]([0.0,6])
annotate("A little\nsketchy",xy=[0.98,.001],	
arrowprops=["arrowstyle"=>"->"],xytext=[1.3,-0.3])

xticks([])
yticks([])
xlabel("TIME")
ylabel("PRODUCTIVITY")
title("An xkcd-style plot in Julia")

ax[:spines]["top"][:set_color]("none")
ax[:spines]["right"][:set_color]("none")


