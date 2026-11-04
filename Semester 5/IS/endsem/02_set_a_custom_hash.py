"""Set A Q2: 32-bit custom hash (same function as Lab 05 Q1)."""

MASK = 0xFFFFFFFF

def custom_hash(text):
    value = 5381
    for character in text:
        value = (value * 33 + ord(character)) & MASK
        value = (value ^ (value >> 16)) & MASK
    return value

text = input("Enter text: ")
print("Hash (hex):", f"{custom_hash(text):08x}")
