"""Lab 02 Q2: AES-128 encryption and decryption."""

from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad

# The 32 hexadecimal digits represent a 16-byte AES-128 key.
key = bytes.fromhex("0123456789ABCDEF0123456789ABCDEF")
message = b"Sensitive Information"

cipher = AES.new(key, AES.MODE_ECB)
ciphertext = cipher.encrypt(pad(message, AES.block_size))
plaintext = unpad(cipher.decrypt(ciphertext), AES.block_size)

print("Ciphertext (hex):", ciphertext.hex())
print("Decrypted text  :", plaintext.decode())
