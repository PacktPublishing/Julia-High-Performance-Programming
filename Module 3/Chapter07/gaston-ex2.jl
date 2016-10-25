using Gaston
g = Gaston; 

set_terminal("x11");

c = g.CurveConf();
c.plotstyle = "pm3d";

x = -15:0.33:15;
y = -15:0.33:15;
Z = g.meshgrid(x, y, (x,y) -> sin(sqrt(x .* x+y .* y))
					 / sqrt(x .* x+y .* y));
g.addcoords(x,y,Z,c);

a = g.AxesConf();
a.title = "3D: Sombrero";
g.addconf(a);
g.llplot()

