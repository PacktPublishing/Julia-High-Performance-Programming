using HTTPClient.HTTPC
using JSON

api = "https://www.googleapis.com/books/v1/volumes"
url = api * "?q=isbn:1408855895"
uu = HTTPC.get(url)
json = JSON.parse(bytestring(uu.body.data));

volumeInfo = json["items"][1]["volumeInfo"]
title   = volumeInfo["title"]
author  = volumeInfo["authors"][1]
publisher = volumeInfo["publishedBy"]
pubdate = volumeInfo["publishedDate"]
ppcoount = volumeInfo["pageCount"]

@printf "%s by %s\nPublished by %s (%s), Pages: $d" title, author, publisher, pubdate, ppcount

