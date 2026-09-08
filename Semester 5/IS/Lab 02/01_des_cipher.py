"""Lab 02 Q1: DES encryption and decryption."""

from Crypto.Cipher import DES
from Crypto.Util.Padding import pad, unpad

key = b"A1B2C3D4"
message = b"Confidential Data"

cipher = DES.new(key, DES.MODE_ECB)
ciphertext = cipher.encrypt(pad(message, DES.block_size))
plaintext = unpad(cipher.decrypt(ciphertext), DES.block_size)

print("Ciphertext (hex):", ciphertext.hex())
print("Decrypted text  :", plaintext.decode())
