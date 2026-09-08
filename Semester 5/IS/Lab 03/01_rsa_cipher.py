"""Lab 03 Q1: RSA encrypt and decrypt a message."""

from Crypto.Cipher import PKCS1_OAEP
from Crypto.PublicKey import RSA

message = b"Asymmetric Encryption"
private_key = RSA.generate(2048)
public_key = private_key.publickey()

encryptor = PKCS1_OAEP.new(public_key)
ciphertext = encryptor.encrypt(message)

decryptor = PKCS1_OAEP.new(private_key)
plaintext = decryptor.decrypt(ciphertext)

print("Public exponent e:", public_key.e)
print("Ciphertext (hex):", ciphertext.hex())
print("Decrypted text  :", plaintext.decode())
