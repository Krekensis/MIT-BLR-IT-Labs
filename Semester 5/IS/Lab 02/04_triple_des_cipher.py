"""Lab 02 Q4: Triple-DES exercise using the supplied repeated key."""

from Crypto.Cipher import DES
from Crypto.Util.Padding import pad, unpad

# The supplied 3DES key is K1 = K2 = K3. EDE then reduces to one DES encryption.
key_part = bytes.fromhex("1234567890ABCDEF")
message = b"Classified Text"

cipher = DES.new(key_part, DES.MODE_ECB)
ciphertext = cipher.encrypt(pad(message, DES.block_size))
plaintext = unpad(cipher.decrypt(ciphertext), DES.block_size)

print("Note: the repeated 3DES key behaves like a single DES key.")
print("Ciphertext (hex):", ciphertext.hex())
print("Decrypted text  :", plaintext.decode())
