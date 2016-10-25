using Compose
function sierpinski(n) 
  if n == 0 
    compose(context(), polygon([(1,1), (0,1), (1/2, 0)]));
  else 
    t = sierpinski(n - 1);
    compose(	context(),	(context( 1/4, 0, 1/2, 1/2), t), 
			 	(context( 0, 1/2, 1/2, 1/2), t), 
				(context( 1/2, 1/2, 1/2, 1/2), t));
  end 
end
 
cx1 = compose(sierpinski(1), linewidth(0.2mm), 
			fill(nothing), stroke("black"));
img = SVG("sierp1.svg", 10cm, 8.66cm); draw(img,cx1)

cx3 = compose(sierpinski(3), linewidth(0.2mm), 
			fill(nothing), stroke("black"));
img = SVG("sierp3.svg", 10cm, 8.66cm); draw(img,cx3)

cx5 = compose(sierpinski(5), linewidth(0.2mm), 
		fill(nothing), stroke("black"));
img = SVG("sierp5.svg", 10cm, 8.66cm); draw(img,cx5)


