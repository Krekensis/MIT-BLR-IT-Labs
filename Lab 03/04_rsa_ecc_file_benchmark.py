"""Lab 03 Q4: compare RSA-2048 and ECC P-256 hybrid file encryption."""

import hashlib
import os
import time
from Crypto.Cipher import AES, PKCS1_OAEP
from Crypto.PublicKey import ECC, RSA
from Crypto.Random import get_random_bytes


def encrypt_aes(data, key):
    cipher = AES.new(key, AES.MODE_EAX)
    ciphertext, tag = cipher.encrypt_and_digest(data)
    return cipher.nonce, ciphertext, tag


def decrypt_aes(package, key):
    nonce, ciphertext, tag = package
    cipher = AES.new(key, AES.MODE_EAX, nonce)
    return cipher.decrypt_and_verify(ciphertext, tag)


def benchmark(size_in_mb):
    file_data = os.urandom(size_in_mb * 1024 * 1024)

    start = time.perf_counter()
    rsa_key = RSA.generate(2048)
    aes_key = get_random_bytes(16)
    wrapped_key = PKCS1_OAEP.new(rsa_key.publickey()).encrypt(aes_key)
    rsa_key_time = time.perf_counter() - start

    start = time.perf_counter()
    rsa_package = encrypt_aes(file_data, aes_key)
    rsa_encrypt_time = time.perf_counter() - start

    start = time.perf_counter()
    recovered_key = PKCS1_OAEP.new(rsa_key).decrypt(wrapped_key)
    rsa_correct = decrypt_aes(rsa_package, recovered_key) == file_data
    rsa_decrypt_time = time.perf_counter() - start

    start = time.perf_counter()
    alice = ECC.generate(curve="P-256")
    bob = ECC.generate(curve="P-256")
    ecc_key_time = time.perf_counter() - start

    shared_point = alice.d * bob.public_key().pointQ
    ecc_aes_key = hashlib.sha256(int(shared_point.x).to_bytes(32, "big")).digest()[:16]
    start = time.perf_counter()
    ecc_package = encrypt_aes(file_data, ecc_aes_key)
    ecc_encrypt_time = time.perf_counter() - start

    receiver_point = bob.d * alice.public_key().pointQ
    receiver_key = hashlib.sha256(int(receiver_point.x).to_bytes(32, "big")).digest()[:16]
    start = time.perf_counter()
    ecc_correct = decrypt_aes(ecc_package, receiver_key) == file_data
    ecc_decrypt_time = time.perf_counter() - start

    print(f"\nFile size: {size_in_mb} MB")
    print(f"RSA: keygen={rsa_key_time:.3f}s encrypt={rsa_encrypt_time:.3f}s decrypt={rsa_decrypt_time:.3f}s verified={rsa_correct}")
    print(f"ECC: keygen={ecc_key_time:.3f}s encrypt={ecc_encrypt_time:.3f}s decrypt={ecc_decrypt_time:.3f}s verified={ecc_correct}")


print("RSA/ECC use hybrid encryption: they protect an AES file key.")
for size in (1, 10):
    benchmark(size)
