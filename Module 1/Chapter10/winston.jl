# Winston:
Pkg.add("Winston")
using Winston
# optionally call figure prior to plotting to set the size
figure(width=600, height=400)
# plot some data
pl = plot(cumsum(rand(500) - 0.5), "r", cumsum(rand(500) - 0.5), "b")
# display the plot (not done automatically!)
display(pl)
println("Press enter to continue: ")
readline(STDIN)
# save the current figure
savefig("winston.svg")