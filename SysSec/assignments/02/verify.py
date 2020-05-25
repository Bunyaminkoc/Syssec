import subprocess
from random import randrange


def main():
    path = "./primes"
    cases = [ -10, -1, 0, 1, 2, 3, 997, 999, 1000, 1001, 4294967295 ]
    [ cases.append( int(randrange(2,1000)) ) for i in range(20) ]



    for i in cases:
        proc = subprocess.Popen([path], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        out, err = proc.communicate( (str(i) + '\n').encode() )
        print(f"Input {i}:")
        print( out.decode().strip('\n'))
        




if __name__ == "__main__":
    main()