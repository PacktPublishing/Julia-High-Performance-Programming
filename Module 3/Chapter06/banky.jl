using SimJulia
using Distributions

function visit(customer::Process,
 			time_in_bank::Float64, 
 			counter::Resource,
 			max_in_queue::Int)
  arrive = now(customer);
  @printf("%8.4f %s: Here I am\n", arrive, customer);
  if length(counter.wait_queue) < max_in_queue
      request(customer, counter);
      wait = now(customer) – arrive;
      @printf("%8.4f %s: Waited %6.3f\n",
 			now(customer), customer, wait);
      hold(customer, time_in_bank)
      release(customer, counter);
      @printf("%8.4f %s: Finished\n", now(customer), customer)
  else
      @printf("%8.4f %s: Waiting\n", now(customer), customer)
  end
end


function generate(source::Process, number::Int,
 			mean_time_between_arrivals::Float64,
 			mean_time_in_bank::Float64,
 			counter::Resource,
 			max_in_queue::Int)
  d_tba = Exponential(mean_time_of_arrivals);
  d_tib = Exponential(mean_time_in_bank);
  for i = 1:number
      c = Process(simulation(source),
 			@sprintf("Customer%02d", i));
    tib = rand(d_tib);
    activate(c, now(source), visit, tib, 
    			counter, max_in_queue);
    tba = rand(d_tba);
    hold(source, tba);
  end
end

function number_in_system(counter::Resource)
  length(counter.active_set) + length(counter.wait_queue);
end

# Set simulation data
max_number = 8;
max_time = 3900.0;
max_queue = 1;
mean_arrival_time = 10.0;
mean_service_time = 12.0;
number_of_tellers = 1;
seed = randomize();	# Use function defined early or pick 
# a value to make run reproducible

# Model/Experiment
srand(seed);
sim = Simulation(uint(16));
k = Resource(sim, "Counter", uint(1), false);
s = Process(sim, "Source");
activate(s, 0.0,  generate, 
max_number, mean_arrival_time,
 	mean_service_time, k, max_queue);
run(sim, max_time);
