"""Lab 02 Q5: AES-192 encryption/decryption and round summary."""

import hashlib
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad

# AES-192 needs 24 bytes. The manual gives 32 hex digits (16 bytes),
# so SHA-256 is used only to derive a valid 24-byte demonstration key.
given_key = bytes.fromhex("FEDCBA9876543210FEDCBA9876543210")
key = hashlib.sha256(given_key).digest()[:24]
message = b"Top Secret Data"

cipher = AES.new(key, AES.MODE_ECB)
ciphertext = cipher.encrypt(pad(message, AES.block_size))
plaintext = unpad(cipher.decrypt(ciphertext), AES.block_size)

print("Initial round: AddRoundKey")
print("Main rounds  : SubBytes, ShiftRows, MixColumns, AddRoundKey")
print("Final round  : SubBytes, ShiftRows, AddRoundKey")
print("Ciphertext (hex):", ciphertext.hex())
print("Decrypted text  :", plaintext.decode())
