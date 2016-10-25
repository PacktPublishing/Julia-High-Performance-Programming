server = listen(8080)
while true
  conn = accept(server)
  @async begin
    try
      while true
        line = readline(conn)
        println(line)
        write(conn,line)
      end
    catch ex
      print("connection ended with error $ex")
    end
  end # end coroutine block
end