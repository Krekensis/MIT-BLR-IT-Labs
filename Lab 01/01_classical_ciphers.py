"""Lab 01 Q1: additive, multiplicative and affine ciphers."""

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


def clean_text(text):
    return "".join(letter for letter in text.upper() if letter.isalpha())


def encrypt(text, a, b):
    result = ""
    for letter in clean_text(text):
        number = ALPHABET.index(letter)
        result += ALPHABET[(a * number + b) % 26]
    return result


def decrypt(text, a, b):
    inverse_a = pow(a, -1, 26)
    return encrypt(text, inverse_a, -inverse_a * b)


message = "I am learning information security"
cipher_list = [("Additive", 1, 20), ("Multiplicative", 15, 0), ("Affine", 15, 20)]

for name, a, b in cipher_list:
    ciphertext = encrypt(message, a, b)
    print(name)
    print("Ciphertext:", ciphertext)
    print("Decrypted :", decrypt(ciphertext, a, b))
    print()
