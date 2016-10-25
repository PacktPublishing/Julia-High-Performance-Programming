# Skipping the argument processing
# Assuming that the input file is quotes.tsv
# and using the test database 

Using DBI
Using MySQL

escticks(s) = replace(s,"'","''");
qq = readdlm("quotes.tsv",'\t');
n = size(qq)[1];
conn = connect(MySQL5,"localhost","malcolm","mypasswd","test");

# We can create the categories table and quotes tables:
sql  = "create table categories ";
sql *= "(id integer primary key, ";
sql *= catname varchar(40) not null);
execute(prepare(conn,sql);
if (errcode(conn) > 0) 
  error("Can't build categories table") 
end;

# Note: Similar code for building the quotes table ...

j = 0;
cats = Dict(String,Int64);

# Main loop to load up the quotes table 
for i = 1:n
  cat = qq[i,1];
  if haskey(cats,cat)
    jd = cats[cat];
  else
    j = j + 1; jd = j;
    cats[cat] = jd;
  end
  sql = "insert into quotes values($i,$jd,";  
  if (length(qq[i,2]) > 0)
    sql *= string("'", escticks(qq[i,2]), "',");
  else
    sql *= string("null,");  
  end
  sql *= string("'", escticks(qq[i,3]), "');");
  stmt = prepare(conn,sql); execute(stmt);
  if errcode(conn) > 0 error(errstring(conn); end;
end

# Now dump the categories
for cat = keys(cats)
  jd = cats[cat];
  sql = "insert into categories($jd,'$cat')";  
  stmt = prepare(conn,sql); execute(stmt);
  if errcode(conn) > 0 error(errstring(conn); end;
end;
disconnect(conn);



