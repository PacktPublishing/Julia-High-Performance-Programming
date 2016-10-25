#! /Users/malcolm/bin/julia -q
#
using ArgParse

const ECHO_PORT = 3000
const ECHO_HOST = "localhost"

function parse_commandline()
  s = ArgParseSettings()
  @add_arg_table s begin
  "--server", "-s"
    help = "hostname of the echo server"
    default = ECHO_HOST
  "--port", "-p"
    help = "port number running the service"
    arg_type = Int
    default = ECHO_PORT
  "--quiet", "-q"
    help = "run quietly, i.e. with no server output"
    action = :store_true
  end
 return parse_args(s)
end

pa = parse_commandline()

ehost = pa["server"]
eport = pa["port"]
vflag = !pa["quiet"]

pp =  (ehost == "localhost" ? "" : "$ehost>")

if vflag println("Listening on port $eport") end
server = listen(eport)
while true
  conn = accept(server)
  @async begin
    try
      while true
        s0 = readline(conn)
        s1 = chomp(s0) 
        if length(chomp(s1)) > 0 
          s2 = reverse(s1)
          if s2 == "." 
            println("Done.")
            close(conn)
            exit(0)
          else
            write(conn,string(pp,s2,"\r\n"))
          end
        end
      end
    catch err
      println("Connection lost:  $err")
      exit(1)
    end
  end
end
