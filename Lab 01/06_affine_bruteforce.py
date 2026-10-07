"""Lab 01 Q6: brute-force affine attack, using ab encrypted as GL."""

import math

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


def decrypt(ciphertext, a, b):
    inverse_a = pow(a, -1, 26)
    plaintext = ""
    for letter in ciphertext:
        value = inverse_a * (ALPHABET.index(letter) - b) % 26
        plaintext += ALPHABET[value]
    return plaintext


ciphertext = "XPALASXYFGFUKPXUSOGEUTKCDGFXANMGNVS"

for a in range(26):
    if math.gcd(a, 26) != 1:
        continue
    for b in range(26):
        # With A = 0: a -> G means b = 6.
        # With A = 0 and B = 1: b -> L means a + b = 11.
        if b == 6 and (a + b) % 26 == 11:
            print("a =", a, "b =", b)
            print("Plaintext:", decrypt(ciphertext, a, b))
