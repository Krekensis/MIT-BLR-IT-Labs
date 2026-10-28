"""Lab 06 Q1: create and verify ElGamal and Schnorr signatures."""

from hashlib import sha256


def hash_number(message):
    return int.from_bytes(sha256(message).digest(), "big")


message = b"Alice approves the document"

# ElGamal signature (small values make the steps easier to learn).
p, g, private_key, k = 23, 5, 6, 7
public_key = pow(g, private_key, p)
r = pow(g, k, p)
s = (pow(k, -1, p - 1) * (hash_number(message) - private_key * r)) % (p - 1)
valid = pow(g, hash_number(message), p) == pow(public_key, r, p) * pow(r, s, p) % p
print("ElGamal signature:", (r, s), "Verified:", valid)

# Schnorr signature (p=23, q=11, and g has order q).
p, q, g, private_key, k = 23, 11, 3, 4, 7
public_key = pow(g, private_key, p)
r = pow(g, k, p)
e = hash_number(message + str(r).encode()) % q
s = (k + private_key * e) % q
valid = pow(g, s, p) == r * pow(public_key, e, p) % p
print("Schnorr signature:", (e, s), "Verified:", valid)
