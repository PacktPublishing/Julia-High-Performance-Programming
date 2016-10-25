function fib_producer(n)
    a, b = (0, 1)
    for i = 1:n
        produce(b)
        a, b = (b, a + b)
    end
end

tsk1 = Task( () -> fib_producer(10) ) # Task (runnable) @0x0000000005696180

consume(tsk1) #> 1
consume(tsk1) #> 1
consume(tsk1) #> 2
consume(tsk1) #> 3
consume(tsk1) #> 5
consume(tsk1) #> 8
consume(tsk1) #> 13
consume(tsk1) #> 21
consume(tsk1) #> 34
consume(tsk1) #> 55
consume(tsk1) #> nothing # Task (done) @0x0000000005696180

for n in tsk1
    println(n)
end
#> 1 1 1 2 3 5 8 13 21 34 55
tsk1 = @task fib_producer(10) # Task (runnable) @0x0000000005696d80