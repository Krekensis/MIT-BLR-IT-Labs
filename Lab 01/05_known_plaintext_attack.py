"""Lab 01 Q5: recover a shift key using known plaintext."""

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


def decrypt(ciphertext, key):
    plaintext = ""
    for letter in ciphertext:
        plaintext += ALPHABET[(ALPHABET.index(letter) - key) % 26]
    return plaintext


known_plaintext = "YES"
known_ciphertext = "CIW"
key = (ALPHABET.index(known_ciphertext[0]) - ALPHABET.index(known_plaintext[0])) % 26

print("Attack type         : Known-plaintext attack")
print("Recovered shift key:", key)
print("Tablet plaintext   :", decrypt("XVIEWYWI", key))
