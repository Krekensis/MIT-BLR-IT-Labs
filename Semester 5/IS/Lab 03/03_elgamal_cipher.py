"""Lab 03 Q3: ElGamal encrypt/decrypt each byte of Confidential Data."""

import secrets

p = 65537
g = 3
private_key = secrets.randbelow(p - 2) + 1
public_key = pow(g, private_key, p)


def encrypt_byte(message_byte):
    random_key = secrets.randbelow(p - 2) + 1
    c1 = pow(g, random_key, p)
    shared_secret = pow(public_key, random_key, p)
    c2 = message_byte * shared_secret % p
    return c1, c2


def decrypt_byte(pair):
    c1, c2 = pair
    shared_secret = pow(c1, private_key, p)
    return c2 * pow(shared_secret, -1, p) % p


message = b"Confidential Data"
ciphertext = [encrypt_byte(byte) for byte in message]
plaintext = bytes(decrypt_byte(pair) for pair in ciphertext)

print("Public key (p, g, h):", (p, g, public_key))
print("Ciphertext pairs:", ciphertext)
print("Decrypted text  :", plaintext.decode())
