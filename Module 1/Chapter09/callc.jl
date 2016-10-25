# calling a function in a shared library:
lang = ccall( (:getenv, "libc"),Ptr{Uint8}, (Ptr{Uint8},), "LANGUAGE")
# ok on Linux
# on Windows: ERROR: error compiling anonymous: could not load module libc: 
# The specified module could not be found.
bytestring(lang) #> "en_US"

# test existence of library:
find_library(["libc"]) #> "libc"