"""Lab 07 Q1: add Paillier-encrypted integers without decrypting them."""

import math
import secrets
from Crypto.Util.number import getPrime


def make_keys():
    p, q = getPrime(128), getPrime(128)
    n = p * q
    lam = math.lcm(p - 1, q - 1)
    return n, pow(lam, -1, n), lam  # public n, private mu and lambda


def encrypt(m, n):
    n2 = n * n
    r = secrets.randbelow(n - 1) + 1
    while math.gcd(r, n) != 1:
        r = secrets.randbelow(n - 1) + 1
    return (1 + m * n) * pow(r, n, n2) % n2  # g = n + 1


def decrypt(c, n, mu, lam):
    n2 = n * n
    return ((pow(c, lam, n2) - 1) // n * mu) % n


n, mu, lam = make_keys()
a, b = 15, 25
ca, cb = encrypt(a, n), encrypt(b, n)
encrypted_sum = ca * cb % (n * n)  # multiplying ciphertexts adds plaintexts

print("Ciphertext of a:", ca)
print("Ciphertext of b:", cb)
print("Encrypted sum:", encrypted_sum)
print("Decrypted sum:", decrypt(encrypted_sum, n, mu, lam))
