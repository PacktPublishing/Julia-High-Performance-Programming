using URIParser, Requests

eacct = "EX123456"
uname = "malcolm@amisllp.com"
pword = "passwd"

dispatcher = "api.esendex.com/v1.0/messagedispatcher2
uri = URI(string(https://,uname,'@',pword,'/',dispatcher)

message = """?xml version'1.0' encoding='UTF-8' ?>
<messages>
<accountreference>EX123456</accountreference>
<message>
<to>447777555666</to>
<body>Every message matters</body>
</message>
</messages>"""

post(uri; data = message)

