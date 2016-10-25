# start the following on the command line:
# julia -p n  # starts n processes on the local machine
# julia -p 8  # starts REPL with 8 workers
workers()
# 8-element Array{Int64,1}:
#   2
#   3
#   4
#   5
#   ⋮
#   8
#   9

# iterate over workers:
for pid in workers()
	# do something with pid
end
myid() # 1
addprocs(5)
# 5-element Array{Any,1}:
#  10
#  11
#  12
#  13
#  14
nprocs() # 14
rmprocs(3) # worker with id 3 is removed

# cluster of computers:
# julia --machinefile machines driver.jl 
# Run processes specified in driver.jl on hosts listed in machines

# primitive operations with processes:
r1 = remotecall(2, x -> x^2, 1000) #> RemoteRef(2,1,20)
fetch(r1) #> 1000000

remotecall_fetch(5, sin, 2pi) # -2.4492935982947064e-16

r2 = @spawnat 4 sqrt(2) # lets worker 4 calculate sqrt(2)
fetch(r2)  #> 1.4142135623730951
r = [@spawnat w sqrt(5) for w in workers()]
# or in a freshly started REPL:
# r = [@spawnat i sqrt(5) for i=1:length(workers())]
# 6-element Array{Any,1}:
#  RemoteRef(1,1,8)
#  RemoteRef(2,1,9)
#  RemoteRef(3,1,10)
#  RemoteRef(4,1,11)
#  RemoteRef(5,1,12)
#  RemoteRef(6,1,13)
r3 = @spawn sqrt(5) #> RemoteRef(5,1,26)
fetch(r3) #> 2.23606797749979

# using @everywhere to make functions available to all workers:
@everywhere w = 8
@everywhere println(myid()) # 1
        # From worker 2:  2
        # From worker 3:  3
        # From worker 4:  4
        # From worker 7:  7
        # From worker 5:  5
        # From worker 6:  6
        # From worker 8:  8
        # From worker 9:  9

@everywhere include("defs.jl")
@everywhere function fib(n)
	if (n < 2) then
	return n
	else return fib(n-1) + fib(n-2)
	end
end
require("functions")

# broadcast data to all workers:
d = "Julia"
for pid in workers()
   remotecall(pid, x -> (global d; d = x; nothing), d)
end
#= Output:
1   From worker 2:  2

    From worker 4:  4
    From worker 5:  5
    From worker 6:  6
=#