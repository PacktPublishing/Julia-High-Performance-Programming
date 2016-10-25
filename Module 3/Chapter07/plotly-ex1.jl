using Plotly

# Signin with your userid and password
Plotly.signin("myuserid", "abc32def7g")

trace1 = [
  "x" => [0, 1, 2, 3, 4, 5, 6, 7, 8], 
  "y" => [8, 7, 6, 5, 4, 3, 2, 1, 0], 
  "type" => "scatter"
];
trace2 = [
  "x" => [0, 1, 2, 3, 4, 5, 6, 7, 8], 
  "y" => [0, 1, 2, 3, 4, 5, 6, 7, 8], 
  "type" => "scatter"
];
data = [trace1, trace2];

layout = [
  "xaxis" => ["type" => "log", "autorange" => true], 
  "yaxis" => ["type" => "log", "autorange" => true]
];

response = Plotly.plot(data, 
		["layout" => layout, 
		 "filename" => "plotly-log-axes", 
		 "fileopt" => "overwrite"]);

plot_url = response["url"]
