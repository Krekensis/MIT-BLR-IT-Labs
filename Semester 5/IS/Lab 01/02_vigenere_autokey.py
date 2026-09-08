"""Lab 01 Q2: Vigenere and autokey ciphers."""

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


def clean_text(text):
    return "".join(letter for letter in text.upper() if letter.isalpha())


def vigenere(text, key, decrypt=False):
    text = clean_text(text)
    key = clean_text(key)
    result = ""

    for position, letter in enumerate(text):
        shift = ALPHABET.index(key[position % len(key)])
        if decrypt:
            shift = -shift
        result += ALPHABET[(ALPHABET.index(letter) + shift) % 26]
    return result


def autokey(text, first_key=7, decrypt=False):
    text = clean_text(text)
    key_stream = [first_key]
    result = ""

    for position, letter in enumerate(text):
        value = ALPHABET.index(letter)
        shift = key_stream[position]
        output = (value - shift if decrypt else value + shift) % 26
        result += ALPHABET[output]
        key_stream.append(output if decrypt else value)
    return result


message = "the house is being sold tonight"
vigenere_cipher = vigenere(message, "dollars")
autokey_cipher = autokey(message)

print("Vigenere ciphertext:", vigenere_cipher)
print("Vigenere decrypted :", vigenere(vigenere_cipher, "dollars", True))
print("Autokey ciphertext :", autokey_cipher)
print("Autokey decrypted  :", autokey(autokey_cipher, decrypt=True))
