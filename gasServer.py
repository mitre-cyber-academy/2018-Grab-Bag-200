import SocketServer
from BaseHTTPServer import BaseHTTPRequestHandler


class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
    	sentStuff = 0
        self.send_response(200)   
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()   
        print((self.path).upper() )
        if self.path.upper() == '/CONNECT/F3:00:A4:D2:AF:E9':
	        self.wfile.write("Connected to F3:00:A4:D2:AF:E9")
	        sentStuff = 1
        if self.path.upper().find("/CONNECT/") is not -1 and sentStuff == 0:
	        output = "Unknown Device "+self.path
	        output = output.replace("/", "")
	        output = output.replace("connect", "")
	        self.wfile.write(output)	
	        sentStuff = 1
        if sentStuff == 0:
	        output = "Unknown Command "+self.path
	        output = output.replace("/", "")
	        self.wfile.write(output)	    	
	        

httpd = SocketServer.TCPServer(("", 8080), MyHandler)
httpd.serve_forever()