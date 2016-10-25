import OpenCL
const cl = OpenCL

const mult_kernel = """
   __kernel void mult(__global const float *a,
                      __global const float *b,
                      __global float *c)
    {
      int gid = get_global_id(0);
      c[gid] = a[gid] * b[gid];
    }
"""

const N = 100_000;
a = rand(Float32, N);
b = rand(Float32, N);

device, ctx, queue = cl.create_compute_context();

a_buff = cl.Buffer(Float32, ctx, (:r, :copy), hostbuf=a);
b_buff = cl.Buffer(Float32, ctx, (:r, :copy), hostbuf=b);
c_buff = cl.Buffer(Float32, ctx, :w, length(a));

p = cl.Program(ctx, source=mult_kernel) |> cl.build!;
k = cl.Kernel(p, "mult");

tm = @elapsed cl.call(queue, k, size(a), nothing, a_buff, b_buff, c_buff);
@printf "Time taken: %f\a sec.\n" tm
