using RDatasets, KernelDensity
mlmf = dataset("mlmRev", "Gcsemv");

df = mlmf[complete_cases(mlmf[[:Written, :Course]]), :];

dc = array(df[:Course]);
dcc = zeros(0);
for i in 1:length(dc)
  if !isnan(dc[i])
    push!(dcc,dc[i])
  end
end
kdc = kde(dcc);

dw = array(df[:Written]);
dww = zeros(0);
for i in 1:length(dw)
  if !isnan(dw[i])
    push!(dww,dw[i])
  end
end
kdw = kde(dww);

using Winston
kdc = kde(dcc); kdw = kde(dww);
plot(kdc.x, kdc.density, "r--", kdw.x, kdw.density, "b;")

