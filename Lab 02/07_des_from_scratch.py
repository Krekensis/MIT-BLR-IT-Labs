"""DES for learning: encrypts one 8-byte block with standard lookup tables."""

from des_tables import E, FP, IP, P, PC1, PC2, S_BOXES, SHIFTS

def bytes_to_bits(data):
    bits = []
    for byte in data:
        bits.extend(int(bit) for bit in f"{byte:08b}")
    return bits


def bits_to_bytes(bits):
    output = bytearray()
    for start in range(0, len(bits), 8):
        output.append(int("".join(map(str, bits[start:start + 8])), 2))
    return bytes(output)


def permute(bits, table):
    """DES tables start counting positions at 1, Python lists at 0."""
    return [bits[position - 1] for position in table]


def xor_bits(left, right):
    return [a ^ b for a, b in zip(left, right)]


def rotate_left(bits, places):
    return bits[places:] + bits[:places]


def make_round_keys(key):
    """Create DES's sixteen 48-bit subkeys."""
    key_bits = permute(bytes_to_bits(key), PC1)  # 64 bits -> 56 bits; discard parity
    left, right = key_bits[:28], key_bits[28:]
    round_keys = []
    for shift in SHIFTS:
        left = rotate_left(left, shift)
        right = rotate_left(right, shift)
        round_keys.append(permute(left + right, PC2))  # 56 bits -> 48 bits
    return round_keys


def sbox_substitution(bits48):
    """Use 8 S-boxes: each changes 6 input bits into 4 output bits."""
    result = []
    for box_number in range(8):
        six_bits = bits48[box_number * 6:box_number * 6 + 6]
        row = 2 * six_bits[0] + six_bits[5]             # first + last bit
        column = int("".join(map(str, six_bits[1:5])), 2)  # middle four bits
        value = S_BOXES[box_number][row][column]
        result.extend(bytes_to_bits(bytes([value]))[-4:])
    return result


def feistel_function(right, round_key):
    """f(R, K) = P(S(E(R) XOR K))."""
    expanded = permute(right, E)                   # 32 bits -> 48 bits
    xored = xor_bits(expanded, round_key)
    substituted = sbox_substitution(xored)         # 48 bits -> 32 bits
    return permute(substituted, P)


def des_encrypt_block(plaintext, key):
    if len(plaintext) != 8 or len(key) != 8:
        raise ValueError("DES needs an 8-byte plaintext and key")

    state = permute(bytes_to_bits(plaintext), IP)
    left, right = state[:32], state[32:]

    for round_key in make_round_keys(key):
        old_right = right
        right = xor_bits(left, feistel_function(right, round_key))
        left = old_right

    return bits_to_bytes(permute(right + left, FP))  # DES swaps halves first


if __name__ == "__main__":
    key = bytes.fromhex("133457799BBCDFF1")
    plaintext = bytes.fromhex("0123456789ABCDEF")
    print("Ciphertext:", des_encrypt_block(plaintext, key).hex().upper())
    # Expected: 85E813540F0AB405
