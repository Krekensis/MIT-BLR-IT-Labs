"""Set A Q1: RSA encryption and decryption without a library."""

# Change p, q, and e as needed for another RSA example.
p, q = 61, 53
n = p * q
phi = (p - 1) * (q - 1)
e = 17
d = pow(e, -1, phi)

message = "Asymmetric Encryption"
ciphertext = [pow(ord(character), e, n) for character in message]
plaintext = "".join(chr(pow(value, d, n)) for value in ciphertext)
ciphertext_hex = "".join(f"{value:03x}" for value in ciphertext)

print("Public key (n, e):", (n, e))
print("Private key (n, d):", (n, d))
print("Ciphertext (hex):", ciphertext_hex)
print("Decrypted text:", plaintext)
print("Matches original:", plaintext == message)
