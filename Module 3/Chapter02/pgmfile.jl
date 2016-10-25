function create_pgmfile(img, outf::String)
    s = open(outf, "w")
    write(s, "P5\n")    
    n, m = size(img)
    write(s, "$m $n 255\n")
    for i=1:n, j=1:m
        p = img[i,j]
        write(s, uint8(p))
    end
    close(s)
end