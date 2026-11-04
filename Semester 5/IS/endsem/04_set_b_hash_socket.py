"""Set B Q2: check message integrity with SHA-256 over a socket."""

import hashlib
import socket
import sys

HOST, PORT = "127.0.0.1", 50008

def make_hash(data):
    return hashlib.sha256(data).hexdigest().encode()

def server():
    with socket.socket() as server:
        server.bind((HOST, PORT))
        server.listen()
        print("Waiting for client...")
        connection, _ = server.accept()
        with connection:
            data = connection.recv(1024)
            connection.send(make_hash(data))
            print("Received:", data.decode())

def client(tamper=False):
    message = b"Integrity protected message"
    sent = b"Tampered message" if tamper else message

    with socket.socket() as client:
        client.connect((HOST, PORT))
        client.send(sent)
        server_hash = client.recv(1024)

    print("Local hash :", make_hash(message).decode())
    print("Server hash:", server_hash.decode())
    print("Integrity OK:", make_hash(message) == server_hash)


if len(sys.argv) > 1 and sys.argv[1] == "server":
    server()
elif len(sys.argv) > 1 and sys.argv[1] == "client":
    client("tamper" in sys.argv)
else:
    print("Run: python 04_set_b_hash_socket.py server|client [tamper]")
