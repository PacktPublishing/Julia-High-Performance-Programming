using DBI, PostgreSQL

connect(Postgres) do conn
  stmt = prepare(conn,"SELECT * FROM \"MediaType\"");
  res = execute(stmt);	  
  for row in res
	@printf "ID: %2d, Media: %s\n" row[1] row[2]
  end
  finish(stmt);  
end
