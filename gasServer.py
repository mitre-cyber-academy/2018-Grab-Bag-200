import SocketServer
import re
import urllib
from BaseHTTPServer import BaseHTTPRequestHandler

flashMemory = [
"""
T1 %B374328830305879^YOU/A GIFT FOR            ^20042222528999242?
T2 ;374328830305879=202012211090924100000?
"""
,
"""
T1 %B374328830305879^YIPYAP/BILLY            ^33212221331999587?
T2 ;374328830305879=201812211090924100000?
"""
,
"""
T1 %B374328830305879^SMITH/JOHN            ^33212221331999587?
T2 ;374328830305879=MCA{201411291500924149303?}
"""
,
"""
T1 %B374328830305879^CLARKARINO/ROBERTO            ^33212221331999587?
T2 ;374328830305879=201812211090924100000?
"""
]


class MyHandler(BaseHTTPRequestHandler):  
    def do_GET(self):
    	global buffa
    	global flashMemory
    	sentStuff = 0
        self.send_response(200)   
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()   
        print((self.path).upper() )
        if self.path.upper() == '/@F3:00:A4:D2:AF:E9$P':
	        self.wfile.write("M")
	        sentStuff = 1
        if self.path.upper() == '/@F3:00:A4:D2:AF:E9$?':
	        self.wfile.write("1")
	        sentStuff = 1  
        if self.path.upper()[:21] == '/@F3:00:A4:D2:AF:E9$D':
        	buffa = (self.path.upper())[21:27]
	        self.wfile.write("OK")
	        sentStuff = 1	        
        if self.path.upper() == '/@F3:00:A4:D2:AF:E9$C':
	        self.wfile.write(buffa)
	        sentStuff = 1	     

        if self.path.upper()[:21] == '/@F3:00:A4:D2:AF:E9$@':
        	returnbit = "";
        	input = self.path.upper();
        	input = urllib.unquote(input).decode('utf8')    
        	print(input)   	
        	m = re.search('@\[(\d+)\]\[(\d+)\]', input)
        	if m != None and len(m.groups()) == 2:
        		flashString = flashMemory[int(m.group(1)) % len(flashMemory)]
        		returnbit = flashString[int(m.group(2)) % len(flashString)]
	        self.wfile.write(returnbit )
	        sentStuff = 1	   

        if sentStuff == 0:
	        output = " "
	        self.wfile.write(output)	    	
	        


httpd = SocketServer.TCPServer(("", 8080), MyHandler)
buffa = "      ";
httpd.serve_forever()