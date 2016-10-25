server = listen(8080)
# TcpServer(listening)
conn = accept(server)
# on the client: $ nc localhost 8080 	
# TcpSocket(connected,0 bytes waiting)
line = readline(conn)
# hello Julia server!	
# "hello Julia server!\n"
write(conn, "Hello back from server to client, what can I do for you?")
56
close(conn)