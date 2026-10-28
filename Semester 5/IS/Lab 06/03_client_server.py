"""Lab 06 Q3: send a signed message from a client to a server."""

import socket
from threading import Thread
from Crypto.Hash import SHA256
from Crypto.PublicKey import RSA
from Crypto.Signature import pkcs1_15

client_key = RSA.generate(2048)
server_public_key = client_key.publickey()
message = b"Alice approves the document"
signature = pkcs1_15.new(client_key).sign(SHA256.new(message))

client, server = socket.socketpair()


def run_server():
    data = server.recv(4096).decode()
    received_message, received_signature = data.split("|", 1)
    try:
        signature_bytes = bytes.fromhex(received_signature)
        pkcs1_15.new(server_public_key).verify(
            SHA256.new(received_message.encode()), signature_bytes
        )
        print("Server: signature valid; message accepted")
    except (ValueError, TypeError):
        print("Server: signature invalid; message rejected")
    server.close()


Thread(target=run_server).start()
client.sendall(message + b"|" + signature.hex().encode())
client.close()
