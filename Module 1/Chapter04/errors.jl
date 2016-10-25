arr = [1,2,3]
# arr[0] #> causes a program stop with: ERROR: BoundsError()
# sqrt(-3) #>  causes an ERROR: DomainError: sqrt will only
sqrt(complex(-3)) #> 0.0 + 1.7320508075688772im

type CustomException <: Exception end

# throw:
codes = ["AO", "ZD", "SG", "EZ"]
# code = "AR"
code = "AO"
if code in codes # in(code, codes)
    println("This is an acceptable code")
else
    throw(DomainError())
end

# error:
function sqroot(n::Int)
    n >= 0 || error("n must be non-negative")
    n == 0 && return 0
    sqrt(n)
end
sqroot(4) #> 2.0
sqroot(0) #> 0.0
# sqroot(-6) #> ERROR: n must be non-negative

warn("Something is not right here")
info("Did you know this?")

type CustomException <: Exception
end

# try / catch
a = []
try
    pop!(a)
catch ex
    println(typeof(ex))  #> ErrorException
    backtrace()
    showerror(STDOUT, ex) #> array must be non-empty
end
# push!(a,1) ERROR: [] cannot grow. Instead, initialize the array with "T[]", where T is the desired element type.

try
   # try this code
catch ex
   if isa(ex, DomainError)
# do this
   elseif isa(ex, BoundsError)
# do this
   end
end

ret = try
         a = 4 * 2
      catch ex
      end
println(ret) #> 8

# finally
f = open("file1.txt", "w") #> IOStream(<file file1.txt>)
try
    # operate on file f
catch ex
finally
    close(f)
end