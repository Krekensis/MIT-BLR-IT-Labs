"""Set B Q1: ElGamal encryption/decryption with the given key values."""

import secrets

# Question values: p=7919, generator g=2 (called e1), private key x=2999 (d).
# The public key value h (called e2) should be e1^d mod p.
p, e1, d = 7919, 2, 2999

e2 = pow(e1, d, p)

def encrypt(m):
    r = secrets.randbelow(p - 2) + 1  # fresh random value for this message byte
    c1 = pow(e1, r, p)
    c2 = m * pow(e2, r, p) % p
    return c1, c2

def decrypt(pair):
    c1, c2 = pair
    k = pow(c1, d, p)
    m = c2 * pow(k, -1, p) % p
    return m

message = b"Asymmetric Algorithms"
ciphertext = [encrypt(byte) for byte in message]
plaintext = bytes(decrypt(pair) for pair in ciphertext)

print("Public key (p, e1, e2):", (p, e1, e2))
print("Private key d:", d)
print("================================")
print("Ciphertext pairs:", ciphertext)


print("Decrypted text:", plaintext.decode())
print("Matches original:", plaintext == message)
