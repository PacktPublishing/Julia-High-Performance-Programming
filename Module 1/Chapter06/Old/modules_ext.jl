module LibA
end

module LibB
	export varB
	varB = 42
end

module LibC
	export varC, funcC
	
	varC = "London"
	function funcC()
		# code
	end

end

module LibD
	export funcD
	function funcD()
		# code
	end
end

module LibE
end