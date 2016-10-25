# this script does not run as a whole 
# (they code snippets are demonstrative, and should be used on their own, and/or in the REPL
# on Julia prompt:
# julia> STDIN
# TTY(open, 0 bytes waiting)
# julia> STDOUT
# TTY(open, 0 bytes waiting)

# read(STDIN, Char)
write(STDOUT, "Julia") #> Julia5
# readbytes(STDIN,3)
# readline(STDIN)
# input:  # Julia
# output: # "Julia\r\n" (Windows) - "Julia\n" (Linux)

# stream can be STDIN or any other input stream:
stream = STDIN
for line in eachline(stream)
    print("Found $line")
end

while !eof(stream)
    x = read(stream, Char)
    println("Found: $x")
end


function process(item)
    # do the processing
end

# files:
names(IOStream)
# 4-element Array{Symbol,1}:
#  :handle
#  :ios
#  :name
#  :mark

IOStream.types
# (Ptr{None},Array{Uint8,1},String,Int64)

# reading:
fname = "example.dat"
f1 = open(fname)
# IOStream(<file example.dat>)

data = readlines(f1)
# 3-element Array{Union(ASCIIString,UTF8String),1}:
#  "this is line 1.\r\n"
#  "this is line 2.\r\n"
#  "this is line 3."

for line in data
	println(line)
	process(line) 
end
close(f1)

open(fname) do file
    process(file)
end

open(fname) do file
    for line in eachline(file)
        print(line) 
        process(line)
    end
end

# writing:
fname = "example2.dat"
f2 = open(fname, "w")
write(f2, "I write myself to a file\n") #> 24
println(f2, "even with println!")
close(f2)

# looping over all files in a folder:
for file in readdir()
	process(file)
end