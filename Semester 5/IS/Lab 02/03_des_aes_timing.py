"""Lab 02 Q3: compare DES and AES-256 timings."""

from time import perf_counter
from Crypto.Cipher import AES, DES
from Crypto.Util.Padding import pad, unpad

message = b"Performance Testing of Encryption Algorithms"


def measure(name, make_cipher, block_size):
    padded_message = pad(message, block_size)
    cipher = make_cipher()

    start = perf_counter()
    ciphertext = cipher.encrypt(padded_message)
    encryption_time = perf_counter() - start

    start = perf_counter()
    plaintext = unpad(make_cipher().decrypt(ciphertext), block_size)
    decryption_time = perf_counter() - start

    print(name)
    print("Encryption time:", f"{encryption_time:.8f}", "seconds")
    print("Decryption time:", f"{decryption_time:.8f}", "seconds")
    print("Verified:", plaintext == message)
    print()


measure("DES", lambda: DES.new(b"A1B2C3D4", DES.MODE_ECB), DES.block_size)
aes_key = bytes.fromhex("0123456789ABCDEF" * 4)
measure("AES-256", lambda: AES.new(aes_key, AES.MODE_ECB), AES.block_size)
