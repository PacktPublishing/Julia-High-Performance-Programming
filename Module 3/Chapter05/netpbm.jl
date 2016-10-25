
function pseudocolor(pix::Uint8)
  if pix < 64
    pr = uint8(0)
    pg = uint8(0)
    pb = uint8(4*pix)
  elseif pix < 128
    pr = uint8(0)
    pg = uint8(4*(pix-64))
    pb = uint8(255)
  elseif pix < 192
    pr = uint8(0)
    pg = uint8(255)
    pb = uint8(4*(192 - pix))
  else
    pr = uint8(4*(pix - 192))
    pg = uint8(4*(256 - pix))
    pb = uint8(0)
  end
  return (pr, pg, pb)
end

img = open("data/juliaset.pgm");
magic = chomp(readline(img));   # => "P5"
if magic == "P5"
 out = open("jsetcolor.ppm", "w");
 println(out, "P6");
 params = chomp(readline(img));  # => "800 400 255"
 println(out, params);
 (wd, ht, pmax) = int(split(params));
 for i = 1:ht
    buf = readbytes(img, wd);
    for j = 1:wd
      (r,g,b) = pseudocolor(buf[j]);
      write(out,r); write(out,g); write(out,b);
    end
 end
 close(out);
else
 error("Not a NetPBM grayscale file")
end
close(img);

