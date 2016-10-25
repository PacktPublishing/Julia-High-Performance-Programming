function bacs ()
  bulls = cows = turns = 0
  a = {}
  srand(int(time()))
  while length(unique(a)) < 4 
    push!(a,rand('0':'9'))
  end
  my_guess = unique(a)
  println("Bulls and Cows")
  while (bulls != 4)
    print("Guess? ")
	if eof(STDIN)
      s = "q"
    else
      s = chomp(readline(STDIN))
    end 
    if (s == "q")
      print("My guess was "); [print(my_guess[i]) for i=1:4]
      return
    end
    guess = collect(s)
    if !(length(unique(guess)) == length(guess) == 4 && all(isdigit,guess))
      print("\nEnter four distinct digits or q to quit: ")
      continue
    end
    bulls = sum(map(==, guess, my_guess))
    cows = length(intersect(guess,my_guess)) - bulls
    println("$bulls bulls and $cows cows!")
    turns += 1
  end
  println("You guessed my number in $turns turns.")
end
