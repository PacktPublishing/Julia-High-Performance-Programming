function para_jset(img)  
   yrange = img[1]  
   xrange = img[2]  
   array_slice = (size(yrange, 1), size(xrange, 1))  
   jset = Array(Uint8, array_slice) 
   x0 = xrange[1]  
   y0 = yrange[1]  

   for x = xrange, y = yrange  
     pix = 256
     z = complex(  (x-width/2)/(height/2), 
			(y-height/2)/(height/2)) 
     for n = 1:256
       if abs(z) > 2
         pix = n-1
         break
       end
       z = z^2 + C
     end
     jset[y - y0 + 1, x - x0 + 1] = uint8(pix)
   end  
   return jset  
end
