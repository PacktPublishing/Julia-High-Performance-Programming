function qserver(sock::Integer)
  fin = open("quotes.txt");
  hdr = "Content-type: text/plain\n\n";
  qa = readlines(fin);
  close(fin);
  qn = length(qa);
  @async begin
    server = listen(sock)
    while true
      qi = rand(1:qn)
      qs = chomp(qa[qi])
      sock = accept(server)
      println(hdr*qs)
    end
  end
end
