using PyCall;
@pyimport smtplib;
fromaddr = "malcolm.sherrington@gmail.com";
toaddrs  = "malcolm@amisllp.com";

messy = """From: $fromaddr
To: $toaddrs
Subject: Test SMTP using PyCall

Testing - 1,2,3
""";

# Note that the blank line is necessary to distinguish
# the SMTP header from the message text.

username = fromaddr;
password = "ABCDEF7890";		# Not my real password 

server = pycall(smtplib.SMTP,PyAny,"smtp.gmail.com:587");
server[:ehlo]();
server[:starttls]();
server[:login](username,password);
server[:sendmail](fromaddr,toaddrs,messy);
server[:quit]();



