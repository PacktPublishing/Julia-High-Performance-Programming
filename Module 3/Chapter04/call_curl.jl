const CURLOPT_URL = 10002
const CURLOPT_FOLLOWLOCATION = 52;
const CURLE_OK = 0
jlo = "http://julialang.org";
curl = ccall( (:curl_easy_init, "libcurl"), Ptr{Uint8}, ())
ccall((:curl_easy_setopt, "libcurl"), Ptr{Uint8}, 
   (Ptr{Uint8}, Int, Ptr{Uint8}), curl, CURLOPT_URL, jlo.data)
ccall((:curl_easy_perform,"libcurl"),
 				Ptr{Uint8}, (Ptr{Uint8},), curl)
ccall((:curl_easy_cleanup,"libcurl"),
Ptr{Uint8},(Ptr{Uint8},), curl);
