using Plotly
§
# Signin with your userid and password
Plotly.signin("myuserid", "abc32def7g")

N = 100;
x = linspace(-2*pi, 2*pi, N);
y = linspace(-2*pi, 2*pi, N);
z = rand(N, N);
for i = 1:N, j = 1:N
    r2 = (x(i)^2 + y(j)^2);
    z(i,j) = sin(x(i)) * cos(y(j)) * sin(r2)/log(r2+1);
end

data = [ [ "z" => z,"x" => x,"y" => y,"type" => "contour"] ];
response = Plotly.plot(data, 
		["filename" => "simple-contour", 
		 "fileopt" => "overwrite"]);

plot_url = response["url"];
Plotly.openurl(plot_url)		# Display the plot via its URL

