import socket

bind_ip = "0.0.0.0"
bind_port = 9999

#Neuen Socket erstellen (mit Default-Werten)
server = socket.socket()

#Socket an Tupel aus IP und Port binden
server.bind((bind_ip,bind_port))

#Verbindungen zulassen; 5 ist die Anzahl der offenen Verbindungen
server.listen(5)

print("[*] Listening on %s:%d" % (bind_ip,bind_port))

def handle_client(client_socket):

	#Nachricht empfangen
	request = client_socket.recv(1024).decode()
	print("[*] Received:", request)

	#Nachricht zuruecksenden
	message = "ACK!"
	byt = message.encode()
	client_socket.send(byt)
	print(client_socket.getpeername())

#Verbindung akzeptieren; IP und Port des Clients werden uebermittlet
client,addr = server.accept()

print("[*] Accepted connection from: %s:%d" % (addr[0], addr[1]))

while True:
	handle_client(client)

#Socket schliessen
server.close()
