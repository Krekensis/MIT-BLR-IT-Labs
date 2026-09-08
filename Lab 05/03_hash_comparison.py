"""Lab 05 Q3: compare MD5, SHA-1 and SHA-256 time/collisions."""

import hashlib
import secrets
import string
import time


def create_dataset(count=75):
    alphabet = string.ascii_letters + string.digits
    values = []
    for _ in range(count):
        length = secrets.randbelow(51) + 20
        values.append("".join(secrets.choice(alphabet) for _ in range(length)))
    return values


def test_algorithm(name, values):
    start = time.perf_counter()
    hashes = [getattr(hashlib, name)(value.encode()).hexdigest() for value in values]
    elapsed = time.perf_counter() - start
    collisions = len(hashes) - len(set(hashes))
    print(f"{name.upper():7} time = {elapsed:.8f}s, collisions = {collisions}")


dataset = create_dataset()
print("Number of random strings:", len(dataset))
for algorithm in ("md5", "sha1", "sha256"):
    test_algorithm(algorithm, dataset)
