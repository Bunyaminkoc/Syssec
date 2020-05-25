import socket
import re

target_host = "127.0.0.1"
target_port = 8000

#Neuen Socket erstellen (mit Default-Werten)
client = socket.socket()

#Client mit Ziel-IP und Ziel-Port verbinden
client.connect((target_host,target_port))

response = ''

i = 0
while i < 10001:
        client.send(str(i).encode('utf-8'))
        response = client.recv(4096).decode()
        if "flag:" in response:
            print(i, re.search(r"flag\{.*\}", response).group())
            break
        i += 1
        if i == 10000:
            i %= 1
        
