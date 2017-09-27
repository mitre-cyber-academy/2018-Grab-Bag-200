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
        if self.path.upper() == '@F3:00:A4:D2:AF:E9$help':
	        self.wfile.write("no help for you")
	        sentStuff = 1

        if sentStuff == 0:
	        output = " "
	        self.wfile.write(output)	    	
	        

httpd = SocketServer.TCPServer(("", 8080), MyHandler)
httpd.serve_forever()