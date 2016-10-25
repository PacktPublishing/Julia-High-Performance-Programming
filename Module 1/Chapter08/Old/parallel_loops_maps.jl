# parallel loops:
function buffon(n)
	hit = 0
	for i = 1:n
		mp = rand()
		phi = (rand() * pi) - pi / 2
		xright = mp + cos(phi)/2
		xleft = mp - cos(phi)/2
		# if xright >= 1 || xleft <= 0
		# 	hit += 1
		# end
		p = (xright >= 1 || xleft <= 0) ? 1 : 0
		hit += p
	end
	miss = n - hit
	piapprox = n / hit * 2
end

@time buffon(100000)
# elapsed time: 0.005487779 seconds (96 bytes allocated)
# 3.1467321186947355
@time buffon(100000000)
# elapsed time: 5.362294859 seconds (96 bytes allocated)
# 3.1418351308191026

function buffon_par(n)
	hit = @parallel (+) for i = 1:n
			mp = rand()
			phi = (rand() * pi) - pi / 2
			xright = mp + cos(phi)/2
			xleft = mp - cos(phi)/2
			(xright >= 1 || xleft <= 0) ? 1 : 0
		end
	miss = n - hit
	piapprox = n / hit * 2
end
@time buffon_par(100000)
# elapsed time: 0.005903334 seconds (296920 bytes allocated)
# 3.136762860727729
@time buffon_par(100000000)
# elapsed time: 0.849702686 seconds (300888 bytes allocated)
# 3.141665751394711

# arr is not correctly initialized:
arr = zeros(100000)
@parallel for i=1:100000
  arr[i] = i
end
#> arr only contains zeros!

# parallel maps:
function rank_marray()
	marr = [rand(1000,1000) for i=1:10]
	for arr in marr
	   println(rank(arr))
	end
end

@time rank_marray()
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# 1000
# elapsed time: 4.351479797 seconds (166177728 bytes allocated, 1.43% gc time)

function prank_marray()
	marr = [rand(1000,1000) for i=1:10]
	println(pmap(rank, marr))
end
@time prank_marray()
# {1000,1000,1000,1000,1000,1000,1000,1000,1000,1000}
# elapsed time: 2.785466798 seconds (163955848 bytes allocated, 1.96% gc time)
