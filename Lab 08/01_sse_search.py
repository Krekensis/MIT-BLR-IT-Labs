"""Lab 08 Q1: search ten AES-encrypted documents using a secret index."""

import hashlib
import hmac
import secrets
from Crypto.Cipher import AES


def encrypt(key, text):
    cipher = AES.new(key, AES.MODE_EAX)
    ciphertext, tag = cipher.encrypt_and_digest(text.encode())
    return cipher.nonce + tag + ciphertext


def decrypt(key, data):
    cipher = AES.new(key, AES.MODE_EAX, nonce=data[:16])
    return cipher.decrypt_and_verify(data[32:], data[16:32]).decode()


key = secrets.token_bytes(16)
documents = {
    "doc1": "the cat likes milk", "doc2": "dogs like playing outside",
    "doc3": "the cat sleeps on sofa", "doc4": "birds can fly high",
    "doc5": "a dog guards the house", "doc6": "cats and dogs are pets",
    "doc7": "the sun is bright today", "doc8": "birds build small nests",
    "doc9": "milk is good for cats", "doc10": "the dog likes its toy",
}

# Encrypt each document and build a keyed word-to-document index.
encrypted_docs = {doc_id: encrypt(key, text) for doc_id, text in documents.items()}
index = {}
for doc_id, text in documents.items():
    for word in set(text.split()):
        token = hmac.new(key, word.encode(), hashlib.sha256).digest()
        index.setdefault(token, []).append(encrypt(key, doc_id))

query = input("Search word: ").lower()
token = hmac.new(key, query.encode(), hashlib.sha256).digest()
matches = [decrypt(key, doc_id) for doc_id in index.get(token, [])]
print("Matching documents:")
for doc_id in matches:
    print(doc_id + ":", decrypt(key, encrypted_docs[doc_id]))
if not matches:
    print("No matches")
