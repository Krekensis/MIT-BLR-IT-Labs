"""Set C Q1: RSA using n=323, e=5 and d=173."""

n, e, d = 323, 5, 173
message = "Cryptographic Protocols"

# Encrypt each character code as a separate RSA block (each is less than n).
ciphertext = [pow(ord(character), e, n) for character in message]
plaintext = "".join(chr(pow(value, d, n)) for value in ciphertext)
ciphertext_hex = "".join(f"{value:03x}" for value in ciphertext)

print("Public key (n, e):", (n, e))
print("Private key (n, d):", (n, d))
print("Ciphertext (hex):", ciphertext_hex)
print("Decrypted text:", plaintext)
print("Matches original:", plaintext == message)
