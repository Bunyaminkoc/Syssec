
import binascii
 
def main():
    P0  = 0x436f6e74656e742d747970653a206d75
    IV  = 0x70ccb336fed2ff10819a78aa36fd7c22
    C0  = 0x4ca5de51dea18d73bcb557cf189e120d
    H   = 0x3c696d67207372633d2f2f652e636e2f

 
    decrypted = P0 ^ IV
    iv_new = decrypted ^ H
 
    print(f"P0= {hex(P0)} - IV = {hex(IV)} - C0 = {hex(C0)} - H = {hex(H)} - NEW IV = {hex(iv_new)}")
 
if __name__ == "__main__":
    main()
