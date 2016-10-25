module MyMod

export hi, inc, fac, fib;

hi() = "Hello"
hi(who::String) = "Hello, $who"

inc(x::Number) = x + 1

function fac(n::Integer)
  @assert n > 0
  (n == 1) ? 1 : n*fac(n-1);
end

function fib_helper(a ::Integer, b::Integer, n::Integer)
   (n > 0) ? fib_helper(b, a+b, n-1) : a
end

function fib(n::Integer)
   @assert n > 0
   fib_helper(0, 1, n)
end

end
