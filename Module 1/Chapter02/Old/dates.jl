# !!! this script needs Julia v 0.4 or greater !!!
# constructing:
d = Date(2014,9,1) #=> 2014-09-01
dt = DateTime(2014,9,1,12,30,59,1) #=> 2014-09-01T12:30:59.001
# accessors:
Dates.year(d)
Dates.month(d)
Dates.week(d)
Dates.day(d)
# functions:
Dates.isleapyear(d)
Dates.dayofyear(d)
Dates.monthname(d)
Dates.daysinmonth(d)
