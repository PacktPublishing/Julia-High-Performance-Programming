using ODBC

conn = ODBC.connect("Chinook",usr="malcolm",pwd="mypasswd")
res = ODBC.query("select count(*) from Customers", conn)
println("Number of customers: $(res[:K][1])")

sql = "select a.LastName, a.FirstName,"; 
sql *= " count(b.InvoiceId) as Invs, sum(b.Total) as Amt";
sql *= " from Customer a";
sql *= " join Invoice b on a.CustomerId = b.CustomerId";
sql *= " group by a.LastName having Amt >= 45.00";
sql *= " order by Amt desc;";

res = ODBC.query(sql);

for i in 1:size(res)[1]
  LastName  = res[:LastName][i]
  FirstName = res[:FirstName][i]
  Invs      = res[:Invs][i]
  Amt       = res[:Amt][i]
  @printf "%10s %10s %4d %10.2f\n" LastName FirstName Invs Amt
end

sql = "select a.LastName, a.FirstName, d.Name as TrackName";
sql *= " from Customer a";
sql *= " join Invoice b on a.CustomerId = b.CustomerId";
sql *= " join InvoiceLine c on b.InvoiceId = c.InvoiceId";
sql *= " join Track d on c.TrackId = d.TrackId";
sql *= " where a.LastName = 'Cunningham' limit 5;";

res = ODBC.query(sql);

for i in 1:size(res)[1]
  LastName  = res[:LastName][i]
  FirstName = res[:FirstName][i]
  TrackName = res[:TrackName][i]
  @printf "%15s %15s %15s\n" LastName FirstName TrackName
end


