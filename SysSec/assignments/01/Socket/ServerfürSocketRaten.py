import argparse
import random
import selectors
import socket

SEL = selectors.DefaultSelector()
FLAG = None


def accept(sock, mask):
    conn, addr = sock.accept()  # Should be ready
    print('accepted', conn, 'from', addr)

    conn.setblocking(False)

    conn.send(b"Welcome to the FLAG GAME 9001!\n")
    conn.send(b"The rules are simple:\n")
    conn.send(b"Provide an integer value between 0 and 10,000. Then I pick a value, if you guessed correctly you get the flag.\n")
    conn.send(b"Good luck :)\n")

    SEL.register(conn, selectors.EVENT_READ, read)


def read(conn, mask):
    data = conn.recv(1000)
    random_number = random.randint(0, 10_000)
    if data:
        try:
            guess = int(data)
            if guess == random_number:
                winner = f"You won! Heres is the flag: {FLAG}\n"
                conn.send(winner.encode("utf-8"))
            else:
                conn.send(b"Sorry you lost :(\n")

        except ValueError:
            conn.send(b"Please provide an integer value only!\n")

    else:
        print('closing', conn)
        SEL.unregister(conn)
        conn.close()


def main(args):
    global FLAG
    FLAG = args.FLAG

    # create a socket for the game server
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        host = "0.0.0.0" if args.outside else "localhost"
        sock.bind((host, 8000))
        sock.listen(100)
        sock.setblocking(False)

        # register in multiplexer
        SEL.register(sock, selectors.EVENT_READ, accept)

        # server loop
        while True:
            events = SEL.select()
            for key, mask in events:
                callback = key.data
                callback(key.fileobj, mask)


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument("FLAG", help="The flag.", type=str)
    parser.add_argument(
        "--outside", help="Run the server on 0.0.0.0 instead. Making it accessible from the outside world.", action="store_true")

    return parser.parse_args()


if __name__ == "__main__":
    main(parse_args())
	
