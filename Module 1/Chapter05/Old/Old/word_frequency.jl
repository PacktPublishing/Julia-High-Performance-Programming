# 1- read in text file:
str = readall("words1.txt")
# println(str) #> to be or not to be that is the question
# 2- replace non alfabet characters and digits from text with space:
nonalfa = r"(\W\s?)"
str = replace(str, nonalfa, ' ')
digits = r"(\d+)"
str = replace(str, digits, ' ')
#> "to be or not to be that is the question "
# 3- split text in words:
word_list = split(str, ' ')
# println(word_list)
#> "to" "be" "or" "not" "to" "be" "that" "is" "the" "question" ""
# 4- make a dictionary with the words and count their frequencies:
word_freq = Dict{String, Int64}()
for word in word_list
    strip(word)
    if isempty(word) continue end
    haskey(word_freq, word) ? word_freq[word] += 1 : word_freq[word] = 1
end
# 5- sort the words (the keys) and print out the frequencies:
println("Word : frequency \n")
words = sort!(collect(keys(word_freq)))
for word in words
    println("$word : $(word_freq[word])")
end
