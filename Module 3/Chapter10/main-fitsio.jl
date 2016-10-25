using FITSIO
using FITSIO.Libcfitsio

# The low-level API is now part of a submodule Libcfitsio

f001 = fits_open_file("f001a066.fits")
n = fits_get_hdrspace(f001)[1]; # => 128

for i = 1:n
   println(fits_read_keyn(f001,i))
end

