using Gaston
g = Gaston; 
set_terminal("x11");

c = g.CurveConf();
c.legend = "Random";
c.plotstyle = "errorbars";

y = exp(-(1:.1:4.9));
ylow = y - 0.05*rand(40);
yhigh = y + 0.05*rand(40);
g.addcoords(1:40,y,c);
g.adderror(0.1*rand(40));

a = g.AxesConf();
a.title = "Error bars (ydelta)";
g.addconf(a);
g.llplot();

