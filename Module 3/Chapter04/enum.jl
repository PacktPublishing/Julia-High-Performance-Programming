@enum STATUS INFO WARNING ERROR FATAL
::Type{enum STATUS (INFO, WARNING, ERROR, FATAL)}

INFO; # => INFO
STATUS(0); # => INFO
STATUS(1); # => WARNING
typeof(INFO); # => enum STATUS (INFO, WARNING, ERROR, FATAL)

The typeof(INFO) looks a bit strange so to see how this occurs let us look at the definition of the enum macro.

macro enum(T,syms...)
  blk = quote
    immutable $(esc(T))
            n::Int32
            $(esc(T))(n::Integer) = new(n)
    end
    Base.show(io::IO, x::$(esc(T))) = print(io, $syms[x.n+1])
    Base.show(io::IO, x::Type{$(esc(T))}) 
       = print(io, 
       $(string("enum ", T, ' ', '(', join(syms, ", "), ')')))
  end
  for (i,sym) in enumerate(syms)
    push!(blk.args, :(const $(esc(sym)) = $(esc(T))($(i-1))))
  end
  push!(blk.args, :nothing)
  blk.head = :toplevel
  return blk
end
