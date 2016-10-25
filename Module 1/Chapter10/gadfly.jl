using Gadfly
draw(SVG("gadfly.svg",6inch,3inch), plot([x -> x^2],0, 25))
pl = plot([x -> cos(x)/x], 5, 25)
draw(PNG("gadfly.png", 300, 100), pl)