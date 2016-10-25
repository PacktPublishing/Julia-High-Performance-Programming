using Gadfly, DataFrames
df = readtable("medical.csv")
print("size is ", size(df)) #> size is (50,7)
df[1:3, 1:size(df,2)]
# data sample:
# IX	Sex	Age	sBP	    dBP	  Drink	BMI
# 0	1	39	106.0	70.0	0	26.97
# 1	2	46	121.0	81.0	0	28.73
# 2	1	48	127.5	80.0	1	25.34

# transforming the data:
df[:Sex] = ifelse(df[:Sex].==1, "F", "M") 
df[:Drink] = ifelse(df[:Drink].==1, "Y", "N")
df[1:3, 1:size(df,2)]
# transformed data sample:
# IX	Sex	Age	sBP	    dBP	  Drink	BMI
# 0	F	39	106.0	70.0	N	26.97
# 1	M	46	121.0	81.0	N	28.73
# 2	F	48	127.5	80.0	Y	25.34

describe(df)
# IX
# Min      0.0
# 1st Qu.  12.25
# Median   24.5
# Mean     24.5
# 3rd Qu.  36.75
# Max      49.0
# NAs      0
# NA%      0.0%

# Sex
# Length  50
# Type    ASCIIString
# NAs     0
# NA%     0.0%
# Unique  2

# Age
# Min      35.0
# 1st Qu.  42.0
# Median   46.0
# Mean     47.86
# 3rd Qu.  52.75
# Max      65.0
# NAs      0
# NA%      0.0%

# sBP
# Min      96.0
# 1st Qu.  119.5
# Median   131.5
# Mean     133.5
# 3rd Qu.  145.75
# Max      206.0
# NAs      0
# NA%      0.0%

# dBP
# Min      63.0
# 1st Qu.  76.375
# Median   84.25
# Mean     84.86
# 3rd Qu.  90.75
# Max      121.0
# NAs      0
# NA%      0.0%

# Drink
# Length  50
# Type    ASCIIString
# NAs     0
# NA%     0.0%
# Unique  2

# BMI
# Min      18.59
# 1st Qu.  23.25
# Median   26.15
# Mean     26.374200000000002
# 3rd Qu.  28.472499999999997
# Max      40.11
# NAs      0
# NA%      0.0%

# And the standard deviations
["Age" std(df["Age"]) "sBP" std(df["sBP"]) "dBP" std(df["dBP"]) "BMI" std(df["BMI"])]
# 1x8 Array{Any,2}:
#  "Age"  8.1941  "sBP"  22.6628  "dBP"  12.5921  "BMI"  4.41216

set_default_plot_size(20cm, 12cm)
plot(df, x="Age", y="sBP", color="Sex", Geom.smooth, Geom.bar(position=:dodge))
pl = plot(df, x="Age", y="sBP", color="Sex", Geom.smooth, Geom.bar(position=:dodge))
draw(PDF("medical.pdf", 6inch, 3inch), pl)