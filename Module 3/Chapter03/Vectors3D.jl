module Vectors3D
import Base.show, Base.convert, Base.abs, Base.dot
export Vector3D, getindex, phi
immutable Vector3D{T <: Real}
   x::T
   y::T
   z::T
end
+(u::Vector3D, v::Vector3D) = Vector3D(u.x + v.x, u.x + v.y, u.z + v.z)
-(u::Vector3D, v::Vector3D) = Vector3D(u.x - v.x, u.x - v.y, u.z - v.z)
*(a::Number, u::Vector3D) = Vector3D(a*u.x, a*u.y, a*u.z)
*(u::Vector3D, a::Number) = Vector3D(a*u.x, a*u.y, a*u.z)
/(a::Number, u::Vector3D) = Vector3D(u.x/a, u.y/a, u.z/a)
/(u::Vector3D, a::Number) = Vector3D(u.x/a, u.y/a, u.z/a)
show{T}(io::IO, u::Vector3D{T}) = print(io, "[$(u.x), $(u.y), $(u.z)]")

abs{T}(u::Vector3D{T}) = (u.x*u.x + u.y*u.y + u.z*u.z)^0.5
function phi(u::Vector3D, v::Vector3D)
  w0 = u.x*v.x + u.y*v.y + u.z*v.z
  w1 = abs(u) * abs(v)
  try
    return atan(w0 / w1)
  catch
    error("Division by zero")
  end
end
dot(u::Vector3D, v::Vector3D) = u.x*v.x + u.y*v.y + u.z+v.z
getindex(u::Vector3D, i) = (i == 1 ? u.x : (i==2 ? u.y : u.z))
convert(::Type{Vector3D}, u::Array{Float64,1}) = 
                                    Vector3D(u[1],u[2],u[3])
end
