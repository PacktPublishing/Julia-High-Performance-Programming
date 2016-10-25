img = open("lena.pgm");
magic = chomp(readline(img));
params = chomp(readline(img));

pm = split(params);
wd = int(pm[1]); 
ht = int(pm[2]);

data = uint8(readbytes(img,wd*ht));
data = reshape(data,wd,ht);
close(img);

dout = copy(data);
for i = 2:wd-1
  for j = 2:ht-1
    temp = data[i-1:i+1, j-1:j+1]; 
    x = sum(Gx.*temp)
    y = sum(Gy.*temp)
    p = int(sqrt(x*x + y*y))
    dout[i,j] = (p < 256) ? uint8(p) : 0xff
  end
end
out = open("lenaX.pgm","w");
println(out,magic);
println(out,params);
write(out,dout);
close(out);


