"""Lab 03 Q5: Diffie-Hellman key exchange with timing."""

import secrets
import time

p = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F
g = 2

start = time.perf_counter()
alice_private = secrets.randbelow(p - 2) + 1
bob_private = secrets.randbelow(p - 2) + 1
alice_public = pow(g, alice_private, p)
bob_public = pow(g, bob_private, p)
key_generation_time = time.perf_counter() - start

start = time.perf_counter()
alice_secret = pow(bob_public, alice_private, p)
bob_secret = pow(alice_public, bob_private, p)
exchange_time = time.perf_counter() - start

print("Shared secrets match:", alice_secret == bob_secret)
print("Key generation time:", f"{key_generation_time:.8f}", "seconds")
print("Key exchange time  :", f"{exchange_time:.8f}", "seconds")
