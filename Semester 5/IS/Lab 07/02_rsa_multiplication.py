"""Lab 07 Q2: multiply RSA-encrypted integers, then decrypt the result."""

from Crypto.Util.number import getPrime, inverse

p, q = getPrime(128), getPrime(128)
n = p * q
phi = (p - 1) * (q - 1)
e = 65537
d = inverse(e, phi)

a, b = 7, 3
ca, cb = pow(a, e, n), pow(b, e, n)
encrypted_product = ca * cb % n  # RSA ciphertext multiplication
product = pow(encrypted_product, d, n)

print("Ciphertext of a:", ca)
print("Ciphertext of b:", cb)
print("Encrypted product:", encrypted_product)
print("Decrypted product:", product)
