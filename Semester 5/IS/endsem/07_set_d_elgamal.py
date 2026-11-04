"""Set D Q1: ElGamal encryption/decryption of Confidential Data."""

import secrets

# Example key values: p is the prime, e1 is the generator, d is private,
# and e2 = e1^d mod p is the public key value.
p, e1, d = 7919, 2, 2999
e2 = pow(e1, d, p)


def encrypt_byte(m):
    r = secrets.randbelow(p - 2) + 1  # fresh random value for this message byte
    c1 = pow(e1, r, p)
    c2 = m * pow(e2, r, p) % p
    return c1, c2


def decrypt_byte(ciphertext_pair):
    c1, c2 = ciphertext_pair
    k = pow(c1, d, p)
    m = c2 * pow(k, -1, p) % p
    return m


message = b"Confidential Data"
ciphertext = [encrypt_byte(byte) for byte in message]
plaintext = bytes(decrypt_byte(pair) for pair in ciphertext)

print("Public key (p, e1, e2):", (p, e1, e2))
print("Private key d:", d)
print("Ciphertext pairs:", ciphertext)
print("Decrypted text:", plaintext.decode())
print("Matches original:", plaintext == message)
