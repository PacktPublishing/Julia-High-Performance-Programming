# This code and all turorial code can be found on https://github.com/forio/julia-tutorials

data = readcsv("data/gasoline.csv")

# Get the columns that correspond with our X values
# and create a new matrix to hold them
# syntax: data[row, column]
# to get a whole row do data[row, :]
# to get a whole column do data[:, column]
# to get a range of columns do data[:, column_a:column_b]

x = data[:, 2:4]
y = data[:, 6]

# Call linreg
coefs = linreg(x, y)
