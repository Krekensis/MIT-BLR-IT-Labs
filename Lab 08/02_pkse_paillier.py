"""Lab 08 Q2: encrypted-index search using Paillier (teaching demo)."""

import hashlib
import math
import secrets
from Crypto.Util.number import getPrime


def make_keys():
    p, q = getPrime(128), getPrime(128)
    n = p * q
    lam = math.lcm(p - 1, q - 1)
    return n, pow(lam, -1, n), lam


def encrypt(m, n):
    n2 = n * n
    r = secrets.randbelow(n - 1) + 1
    while math.gcd(r, n) != 1:
        r = secrets.randbelow(n - 1) + 1
    return (1 + m * n) * pow(r, n, n2) % n2


def decrypt(c, n, mu, lam):
    return ((pow(c, lam, n * n) - 1) // n * mu) % n


n, mu, lam = make_keys()
documents = {
    "doc1": "the cat likes milk", "doc2": "dogs like playing outside",
    "doc3": "the cat sleeps on sofa", "doc4": "birds can fly high",
    "doc5": "a dog guards the house", "doc6": "cats and dogs are pets",
    "doc7": "the sun is bright today", "doc8": "birds build small nests",
    "doc9": "milk is good for cats", "doc10": "the dog likes its toy",
}

# Store encrypted word and document-ID pairs as the encrypted inverted index.
index = []
for doc_id, text in documents.items():
    for word in set(text.split()):
        word_number = int.from_bytes(hashlib.sha256(word.encode()).digest(), "big") % n
        index.append((encrypt(word_number, n), encrypt(int(doc_id[3:]), n)))

query = input("Search word: ").lower()
query_number = int.from_bytes(hashlib.sha256(query.encode()).digest(), "big") % n
encrypted_query = encrypt(query_number, n)

# Paillier is randomized, so a real system cannot compare ciphertexts directly.
# This demo gives the private key to the search step to decrypt and compare terms.
matches = []
for encrypted_word, encrypted_doc in index:
    if decrypt(encrypted_word, n, mu, lam) == decrypt(encrypted_query, n, mu, lam):
        doc_id = "doc" + str(decrypt(encrypted_doc, n, mu, lam))
        if doc_id not in matches:
            matches.append(doc_id)

print("Encrypted query created; matching IDs:", matches)
for doc_id in matches:
    print(doc_id + ":", documents[doc_id])
