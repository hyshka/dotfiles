"""Simple server for listening to connections."""
import socket
import subprocess
import time

import pyperclip

def receive_all(socket: socket.socket):
    """We're assuming small payloads of text.

    TCP is streaming, we're assuming that copying text will be no bigger than
    'max_buff_size' in bytes.
    """
    max_buff_size = 8192
    data = socket.recv(max_buff_size)
    socket.close()
    return data

def parse_data(data: bytes):
    """Parse data sent to socket."""
    data_str = data.decode('utf-8').strip()
    num_lines = len(data_str.splitlines())
    # Check if it was a docker port passed back
    print(data_str)
    if num_lines == 1:
        try:
            int_input = int(data_str)
        except ValueError:
            pass
        else:
            if 1000 < int_input < 40000:
                print('Opening Docker port: {}'.format(int_input))
                proc = subprocess.Popen(
                    ['ssh', '-nNT', '-L', '{}:localhost:{}'.format(int_input, int_input), 'dev-toronto'],
                    stdout=subprocess.PIPE
                )
                time.sleep(0.5)  # Wait for SSH to connect
                proc = subprocess.Popen(
                    ['firefox-developer-edition', 'http://localhost:{}'.format(int_input)],
                    stdout=subprocess.PIPE
                )
                return
    pyperclip.copy(data_str)


def listen_for_data(sock: socket.socket) -> None:
    """Make the socket listen for data forever."""
    host = 'localhost'
    port = 41401
    sock.bind((host, port))
    sock.listen(1)
    while True:
        print('Waiting...')
        conn, addr = sock.accept()
        print(f'Connection from {addr}')
        if addr[0] != '127.0.0.1':
            continue
        with conn:
            data = receive_all(conn)
            parse_data(data)


if __name__ == '__main__':
    print('Attempting to forward SSH port')
    subprocess.Popen(
        ['ssh', '-nNT', '-R', '41401:localhost:41401', 'dev-toronto'],
        stdout=subprocess.PIPE,
    )
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Previous executions can leave socket in TIME_WAIT, prevent this.
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    listen_for_data(sock)
