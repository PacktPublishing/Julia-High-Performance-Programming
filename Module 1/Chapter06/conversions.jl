# (31+42)::Float64 #> TypeError(:typeassert,"",Float64,73)
# convert(Int64, 7.01) #> ERROR: InexactError()
convert(Int64, 7.0) #> 7
int64(7.0) #> 7
int64(7.01) #> 7
# convert(Int64, "CV")
# ERROR: `convert` has no method matching convert(::Type{Int64}, ::ASCIIString)
# convert(Int64, "123") # same ERROR as above

promote(1, 2.5, 3//4) #> (1.0,2.5,0.75)
promote(1.5, im) #> (1.5 + 0.0im,0.0 + 1.0im)
promote(true, 'c', 1.0) #> (1.0,99.0,1.0)

promote_type(Int8, Uint16) #> Int64