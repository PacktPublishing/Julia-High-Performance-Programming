# calling a function in a shared library:
lang = ccall( (:getenv, "libc"),Ptr{Uint8}, (Ptr{Uint8},), "LANGUAGE")
bytestring(lang) #> "en_US"

# test existence of library:
find_library(["libc"]) #> "libc"