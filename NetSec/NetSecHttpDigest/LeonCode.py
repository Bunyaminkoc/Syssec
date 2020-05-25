
import sys
import hashlib
import binascii
from binascii import hexlify as h


def main():
    if len(sys.argv) == 3:
        if sys.argv[1] in ("-f", "--file"):
            HA1     = hashlib.md5()
            HA2     = hashlib.md5()
            RESP    = hashlib.md5()

            username    = "waschbaermann"
            realm       = "HTTP Digest Verzeichnisschutz"
            nonce       = "v0jB77mjBQA=c433c4aa74cf8815d1c96a6f6b8851bac0cde6dd"
            response    = "04ffc124252aeb595bc58a3b1e6f0698"
            requesturi  = "/digestAuth/"
            method      = "GET"

            with open(sys.argv[2], "r", encoding='latin-1') as passwords:
                for line in passwords.readlines() :
                    HA1.update( (username + ":" + realm + ":" + line).encode("utf-8") )
                    HA2.update( (method + ":" + requesturi).encode("utf-8") )
                    RESP.update( (binascii.b2a_hex( HA1.digest() ) + ":" + nonce + ":" + binascii.b2a_hex( HA2.digest())).encode("utf-8") )
                    print(f"PWD = { line }  HA1 = { h(HA1.digest()) }  HA2 = { h(HA2.digest()) }  RESP = { h(RESP.digest()) }")

                    if response == h(RESP.digest()):
                        print(f"[+] Found Correct Password : {line}")

        else:
            print(f"[-] Invalid Argument \"{ sys.argv[1] }\"")
    else:
        print("[-] Not enough Arguments")

if __name__ == "__main__":
    main()
gistfile1.txt
# https://tools.ietf.org/html/rfc2617
# http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
