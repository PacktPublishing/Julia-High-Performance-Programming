using Morsel;
using SQLite;

db = SQLiteDB("quotes.db");
try
  res = query(db,"select count(*) from quotes");
catch
  error("Can't find quotes table");
end
nq = res[1][1];

@assert nq > 0;

htmlH = """<!DOCTYPE html>
<html lang='en-US'>
<head>
<title>Julia Quotes Server<</title>
</head>
<body>""";

htmlF= "</body></html>";

app = Morsel.app();
route(app, POST | PUT, "/") do req, res
 htmlB = "<h2>Posting data to the server is not allowed</h2>";
 string(htmlH,htmlB,htmlF);
end

get(app, "/") do req, res
  qid = rand(1:nq);
  sql = "select q.author,c.catname,q.quoname from quotes q ";
  sql *= "join categories c on q.cid = c.id and q.id = $qid";
  res = query(db,sql);
  author  = res[1][1];
  catname = res[2][1];
  quotext = res[3][1];
  htmlB = "<p>$quotext<br/><i>$author ($catname)</i></p>";
  string(htmlH,htmlB,htmlF);
end

