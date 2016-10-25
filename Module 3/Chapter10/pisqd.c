#include <stdio.h>
#include <math.h>
#include <julia.h>

// LIBEXEC will vary with the operating system being used
#define LIBEXEC "/usr/lib64/julia"

int main() {
  jl_init(LIBEXEC);
  JL_SET_STACK_BASE;
  jl_function_t *func = jl_get_function(jl_base_module, "^");
  jl_value_t *arg1 = jl_box_float64(M_PI);
  jl_value_t *arg2 = jl_box_float64(2.0);
  jl_value_t *ret = jl_call2(func, arg1, arg2);
  if (jl_is_float64(ret)) {
     double pi2 = jl_unbox_float64(ret);
     printf("PI (squared) is %f\n", pi2);
  }
  return 0;
} 
