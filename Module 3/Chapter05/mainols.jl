include("./ols.jl")

data = readcsv("data/gasoline.csv")

# Get the columns that correspond with our X values 
# and create a new matrix to hold them
# syntax: data[row, column]
# to get a whole column do data[:, column]
# to get a whole row do data[row, :]
x = [data[:,2] data[:,3] data[:,4]]
y = data[:,6]

# Create a new OLS object
reg = ols.tols(y, x, "Octane Rating", ["Error", "Component 1", "Component 2", "Component 3"])

