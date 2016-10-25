using Quandl, DataFrames, Redis, Winston

qapi_key = "aaaaaaaaaaaaaaaaaaaa"	# Your Quandl key
set_auth_token(qapi_key)

qdf1 = quandl("WIKI/AAPL", format="DataFrame", order="asc");
aapl = convert(Array, qdf1[:Close]);
scf1 = 1.0/aapl[1];  aapl = scf1 .* aapl;

qdf2 = quandl("WIKI/MSFT", format="DataFrame", order="asc");
msft = convert(Array, qdf2[:Close]);
scf2 = 1.0/msft[1];  msft = scf2 .* msft;

n = [1:length(aapl)];
conn = RedisConnection()
for i = 1:n
  rpush(conn,'APPL~Close',aapl[i])
  rpush(conn,'MSFT~Close',msft[i])
end

t = [1:n];		# Just plot the data not the dates

aapl-data = float32(lrange(conn,'AAPL~Close',0,-1);
msft-data = float32(lrange(conn,'MSFT~Close',0,-1);
plot(t, aapl-data,"b--", t, msft-data, "r.");
