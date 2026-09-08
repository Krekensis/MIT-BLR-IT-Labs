"""Lab 03 Q2: small ECIES-style demonstration on secp256r1.
ECC creates a shared secret; SHAKE-256 converts it into a byte stream.
"""

import hashlib
import secrets

P = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
A = P - 3
G = (0x6B17D1F2E12C4247F8BCE6E563A440F277037D812DEB33A0F4A13945D898C296,
     0x4FE342E2FE1A7F9B8EE7EB4A7C0F9E162BCE33576B315ECECBB6406837BF51F5)
N = 0xFFFFFFFF00000000FFFFFFFFFFFFFFFFBCE6FAADA7179E84F3B9CAC2FC632551


def add_points(first, second):
    if first is None:
        return second
    if second is None:
        return first

    x1, y1 = first
    x2, y2 = second
    if x1 == x2 and (y1 + y2) % P == 0:
        return None

    if first == second:
        slope = (3 * x1 * x1 + A) * pow(2 * y1, -1, P)
    else:
        slope = (y2 - y1) * pow(x2 - x1, -1, P)
    slope %= P

    x3 = (slope * slope - x1 - x2) % P
    y3 = (slope * (x1 - x3) - y1) % P
    return x3, y3


def multiply_point(number, point):
    answer = None
    while number > 0:
        if number % 2 == 1:
            answer = add_points(answer, point)
        point = add_points(point, point)
        number //= 2
    return answer


def make_stream(point, length):
    shared_x = point[0].to_bytes(32, "big")
    return hashlib.shake_256(shared_x).digest(length)


message = b"Secure Transactions"
private_key = secrets.randbelow(N - 1) + 1
public_key = multiply_point(private_key, G)

ephemeral_key = secrets.randbelow(N - 1) + 1
ephemeral_public = multiply_point(ephemeral_key, G)
shared_secret = multiply_point(ephemeral_key, public_key)

stream = make_stream(shared_secret, len(message))
ciphertext = bytes(a ^ b for a, b in zip(message, stream))

receiver_secret = multiply_point(private_key, ephemeral_public)
plaintext = bytes(a ^ b for a, b in zip(ciphertext, make_stream(receiver_secret, len(message))))

print("Ciphertext (hex):", ciphertext.hex())
print("Decrypted text  :", plaintext.decode())
