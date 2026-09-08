"""Lab 01 Q4: Hill cipher with key matrix [[3, 3], [2, 7]]."""

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
KEY = ((3, 3), (2, 7))


def clean_text(text):
    text = "".join(letter for letter in text.upper() if letter.isalpha())
    return text if len(text) % 2 == 0 else text + "X"


def crypt(text, key):
    result = ""
    for index in range(0, len(text), 2):
        first = ALPHABET.index(text[index])
        second = ALPHABET.index(text[index + 1])
        result += ALPHABET[(key[0][0] * first + key[0][1] * second) % 26]
        result += ALPHABET[(key[1][0] * first + key[1][1] * second) % 26]
    return result


def inverse_key():
    determinant = (KEY[0][0] * KEY[1][1] - KEY[0][1] * KEY[1][0]) % 26
    inverse = pow(determinant, -1, 26)
    return ((inverse * KEY[1][1] % 26, -inverse * KEY[0][1] % 26),
            (-inverse * KEY[1][0] % 26, inverse * KEY[0][0] % 26))


plaintext = clean_text("We live in an insecure world")
ciphertext = crypt(plaintext, KEY)
print("Ciphertext:", ciphertext)
print("Decrypted :", crypt(ciphertext, inverse_key()))
