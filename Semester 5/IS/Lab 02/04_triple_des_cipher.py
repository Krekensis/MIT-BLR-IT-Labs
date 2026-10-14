"""Lab 02 Q4: Triple-DES exercise using the supplied repeated key."""

from Crypto.Cipher import DES3
from Crypto.Random import get_random_bytes
from Crypto.Util.Padding import pad, unpad

key = DES3.adjust_key_parity(get_random_bytes(16))
message = "Classified text"

cipher = DES3.new(key, DES3.MODE_ECB)
ciphertext = cipher.encrypt(pad(message.encode(), DES3.block_size))
plaintext = unpad(cipher.decrypt(ciphertext), DES3.block_size)

print("Encrypted:", ciphertext.hex())
print("Decrypted:", plaintext.decode())