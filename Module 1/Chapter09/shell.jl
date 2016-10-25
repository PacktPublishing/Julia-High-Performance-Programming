pwd() 
# cd("d:\\test\\week1")
# shell mode:
# ; ls
# ; mkdir folder
# ; cd folder

cmd = `echo Julia is smart`
typeof(cmd) #> Cmd (constructor with 1 method)
run(cmd) #> Julia is smart
run(`date`) #> Sun Oct 12 09:44:50 GMT 2014
cmd = `cat file1.txt`
run(cmd) #> text from file1.txt: This a a test for try / catch / finally
success(cmd) #> true

# interpolation:
file = "file1.txt"
cmd = `cat $file`
run(cmd) #> text from file1.txt: This a a test for try / catch / finally
# cmd = `ls *.*`   # works only on Windows! not in general
# https://groups.google.com/forum/#!topic/julia-users/hzBeluKU7P0
# run(cmd) #> returns: file1.txt  shell.jl  test.txt
# pipelining:
run(`cat $file` |> "test.txt") #> text from file1.txt is written into test.txt
run("test.txt" |> `cat`)
run(`echo $("\nhi\nJulia")` |> `cat` |> `grep -n J`) #> 3:Julia
run(`cat "tosort.txt"` |> `sort`) # returns A B C

println()
println("Output grep command:")
# run(`grep is $(readdir())`) # returns where "is" is found in text files in current dir
#=
array_product_benchmark.jl:# gc_disable()
callc.jl:# test existence of library:
file1.txt:This a a test for try / catch / finally
performance.jl:foo1(x::Int) = isprime(x) ? x: false
shell.jl:cmd = `echo Julia is smart`
shell.jl:run(cmd) #> Julia is smart
shell.jl:run(cmd) #> text from file1.txt: This a a test for try / catch / finally

shell.jl:run(cmd) #> text from file1.txt: This a a test for try / catch / finally

shell.jl:run(`cat $file` |> "test.txt") #> text from file1.txt is written into te
st.txt
shell.jl:run(`grep is $(readdir())`) # returns where "is" is found in text files
in current dir
shell.jl:# CThis a a test for try / catch / finally
test.txt:This a a test for try / catch / finally
=#
println()

# reading the output of the command:
a = readall(`cat "tosort.txt"` |> `sort`)
#> a has value "A\r\nB\r\nC\n"

run(`cat "file1.txt"` & `cat "tosort.txt"`)
# B
# A
# CThis a a test for try / catch / finally

# platform variations:
fun1 = ()
fun2 = ()
@windows ? fun1 : fun2