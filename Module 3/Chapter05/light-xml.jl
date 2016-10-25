using LightXML
xdoc = parse_file("data/books.xml");
xtop = root(xdoc);
println(name(xtop));

for c in child_nodes(xtop)
    if is_elementnode(c)
        e = XMLElement(c)
        t = find_element(e, "title")
        title = content(t)
        genre = attribute(t, "genre")
        @printf "%20s :%s\n" title genre
    end
end       

for c in child_nodes(xtop)
   if is_elementnode(c)
      e = XMLElement(c)
      t = find_element(e, "title")
      genre = attribute(t, "genre")
      if genre == "Computing"
         a = find_element(e,"author")
         p = find_element(e,"price")
         curr = attribute(p, "currency")
         ds = find_element(e,"publish_date")
         desc = find_element(e,"description")
         println("Title:      ", content(t))
         println("Author:     " ,content(a))    
         println("Date:       " ,ds)
         println("Price:      " ,p ," (", curr, ")")
         println(content(desc),"\n");
      end
   end
end
