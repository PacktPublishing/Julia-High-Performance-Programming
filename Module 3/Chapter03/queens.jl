qadd(board::Array{Vector{Int}}, 
         qrow::Vector{Int}) = push!(copy(board), qrow)
qhits(a::Array{Int}, b::Array{Int}) = 
           any(a .== b) || abs(a-b)[1] == abs(a-b)[2]
qhit(qrow::Vector{Int}, board::Array{Vector{Int}}) = 
any(map(x->qhits(qrow, x), board))

function qsolve(m, n=m, board=Array(Vector{Int}, 0))
  if n == 0
    return board
  end
  for px = 1:m
    for py = 1:m
      if !qhit([px, py], board)
        s = qsolve(m, n-1, qadd (board, [px, py]))
        s != nothing && return s
      end
    end
  end
  return nothing
end
