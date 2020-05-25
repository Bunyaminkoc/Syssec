import socket

target_host = "0.0.0.0"
target_port = 9999

def message_handler(msg):

	#Daten senden
	byt = msg.encode()
	client.send(byt)

	#Daten empfangen
	response = client.recv(4096).decode()
	print('Response:', response)

#Neuen Socket erstellen (mit Default-Werten)
client = socket.socket()

#Client mit Ziel-IP und Ziel-Port verbinden
client.connect((target_host,target_port))

message_handler("Connection established. \r\n\r\n")

while True:
	#Eingabe von Kommandozeile hinter den Zeichen '>> ' einlesen
	message = input(">> ")
	message_handler(message)
