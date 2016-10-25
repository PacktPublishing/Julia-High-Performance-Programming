using HTTPClient.HTTPC, JSON
cdb = "http://localhost:5984";
dbs = bytestring(get("$cdb/_all_dbs).body.data);
JSON.parse(dbs); # => ["_replicator", "_users", "_quotes"]

qc = cdb * "/quotes";
ropts = RequestOptions(content_type="application/json");

json =  "{category:\"Computing\",author:\"Scott's Law\",
\"quote\":\"Adding manpower to a late software project makes it later\"})";
HTTPC.post(qc, json, ropts);

json = JSON.parse(docs.body.data));

json["total_rows"]; # => 35
json["rows"][24];   # Pick out an specific record
Dict{String,Any} with 3 entries:
  "key"   => "d075d58c26d256c49b965a02cc00b77a"
  "id"    => "d075d58c26d256c49b965a02cc00b77a"
  "value" => ["rev"=>"1-524b4b2c577e2eaff31f4b665cd48055"]
key = json["rows"][24]["key"];	
rev = json["rows"][24]["value"]["rev"];

JSON.parse(bytestring(get("$qc/$key").body.data))
Dict{String,Any} with 5 entries:
  "quote"    => 
      "To love oneself is the beginning of a lifelong romance"
  "_rev"     => "1-524b4b2c577e2eaff31f4b665cd48055"
  "author"   => "Oscar Wilde"
  "_id"      => "d075d58c26d256c49b965a02cc00b77a"
  "category" => "Books & Plays"

json =  "{category:\"Books & Plays\",author:\"Oscar Wilde\",
\"quote\":\"I can resist everything but temptation\"})";
HTTPC.post("$qc/$key", json, ropts);

