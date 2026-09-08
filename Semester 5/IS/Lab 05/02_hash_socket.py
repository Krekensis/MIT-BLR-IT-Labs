"""Lab 05 Q2. Run server first, then client (optionally with tamper)."""

import hashlib
import socket
import sys

HOST = "127.0.0.1"
PORT = 50007


def make_hash(data):
    return hashlib.sha256(data).hexdigest().encode()


def run_server():
    with socket.socket() as server:
        server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server.bind((HOST, PORT))
        server.listen(1)
        print("Server waiting on port", PORT)

        connection, _ = server.accept()
        with connection:
            received_data = connection.recv(4096)
            connection.sendall(make_hash(received_data))
            print("Received:", received_data.decode(errors="replace"))


def run_client(tamper=False):
    original_data = b"Integrity protected message"
    sent_data = original_data[:-1] + b"!" if tamper else original_data

    with socket.create_connection((HOST, PORT)) as client:
        client.sendall(sent_data)
        server_hash = client.recv(128)

    local_hash = make_hash(original_data)
    print("Local hash :", local_hash.decode())
    print("Server hash:", server_hash.decode())
    print("Integrity OK:", local_hash == server_hash)


if len(sys.argv) < 2:
    print("Usage: python 02_hash_socket.py server|client [tamper]")
elif sys.argv[1] == "server":
    run_server()
elif sys.argv[1] == "client":
    run_client("tamper" in sys.argv[2:])
