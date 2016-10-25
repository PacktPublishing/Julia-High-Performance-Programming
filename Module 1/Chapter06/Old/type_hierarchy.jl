typeof(2) #> Int64
typeof(Int64) #> DataType
typeof(Complex{Int64}) #> DataType
typeof(Any) #> DataType
typeof(DataType) #> DataType

super(Int64) #> Signed
super(Signed) #> Integer
super(Integer) #> Real
super(Real) #> Number
super(Number) #> Any
super(Any) #> Any

subtypes(Integer) #> 5-element Array{Any,1}:
# BigInt
# Bool
# Char
# Signed
# Unsigned
subtypes(Signed) #> 5-element Array{Any,1}:
# Int128
# Int16
# Int32
# Int64
# Int8
subtypes(Int64) #> 0-element Array{Any,1}
typeof(None) #> UnionType

Bool <: Integer #> true
Bool <: Any #> true
Bool <: Char #> false
issubtype(Bool, Integer) #> true
issubtype(Float64, Integer) #> false

typeof(5) #> Int64
isa(5, Number) #> true
