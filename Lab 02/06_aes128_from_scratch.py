"""AES-128 for learning: encrypts one 16-byte block without external packages."""


def xor_bytes(left, right):
    """XOR matching byte values."""
    return [a ^ b for a, b in zip(left, right)]


def xtime(value):
    """Multiply a byte by 2 in AES's GF(2^8) field."""
    value <<= 1
    if value & 0x100:
        value ^= 0x11B
    return value & 0xFF


def gf_multiply(a, b):
    """Multiply bytes in AES's finite field."""
    answer = 0
    for _ in range(8):
        if b & 1:
            answer ^= a
        a = xtime(a)
        b >>= 1
    return answer


def gf_power(base, exponent):
    answer = 1
    while exponent:
        if exponent & 1:
            answer = gf_multiply(answer, base)
        base = gf_multiply(base, base)
        exponent >>= 1
    return answer


def rotate_byte_left(value, places):
    return ((value << places) | (value >> (8 - places))) & 0xFF


def aes_sbox(value):
    """S-box: multiplicative inverse, then the AES affine transformation."""
    inverse = 0 if value == 0 else gf_power(value, 254)
    return (inverse ^ rotate_byte_left(inverse, 1) ^ rotate_byte_left(inverse, 2)
            ^ rotate_byte_left(inverse, 3) ^ rotate_byte_left(inverse, 4) ^ 0x63)


def add_round_key(state, round_key):
    return xor_bytes(state, round_key)


def sub_bytes(state):
    return [aes_sbox(byte) for byte in state]


def shift_rows(state):
    """AES stores columns first; row n is moved left by n positions."""
    shifted = [0] * 16
    for row in range(4):
        for column in range(4):
            old_column = (column + row) % 4
            shifted[4 * column + row] = state[4 * old_column + row]
    return shifted


def mix_one_column(a, b, c, d):
    """Multiply a column by AES's fixed MixColumns matrix."""
    return [gf_multiply(a, 2) ^ gf_multiply(b, 3) ^ c ^ d,
            a ^ gf_multiply(b, 2) ^ gf_multiply(c, 3) ^ d,
            a ^ b ^ gf_multiply(c, 2) ^ gf_multiply(d, 3),
            gf_multiply(a, 3) ^ b ^ c ^ gf_multiply(d, 2)]


def mix_columns(state):
    mixed = []
    for start in range(0, 16, 4):
        mixed.extend(mix_one_column(*state[start:start + 4]))
    return mixed


def expand_key(key):
    """AES-128 key schedule: 16-byte key becomes eleven round keys."""
    words = [list(key[i:i + 4]) for i in range(0, 16, 4)]
    rcon = 1
    for word_number in range(4, 44):
        previous = words[word_number - 1][:]
        if word_number % 4 == 0:
            previous = previous[1:] + previous[:1]       # RotWord
            previous = [aes_sbox(byte) for byte in previous]  # SubWord
            previous[0] ^= rcon
            rcon = xtime(rcon)
        words.append(xor_bytes(words[word_number - 4], previous))
    return [sum(words[i:i + 4], []) for i in range(0, 44, 4)]


def aes_encrypt_block(plaintext, key):
    if len(plaintext) != 16 or len(key) != 16:
        raise ValueError("AES-128 needs a 16-byte plaintext and key")
    round_keys = expand_key(key)
    state = add_round_key(list(plaintext), round_keys[0])

    for round_number in range(1, 10):
        state = sub_bytes(state)
        state = shift_rows(state)
        state = mix_columns(state)
        state = add_round_key(state, round_keys[round_number])

    # Final round has no MixColumns.
    state = add_round_key(shift_rows(sub_bytes(state)), round_keys[10])
    return bytes(state)


if __name__ == "__main__":
    key = bytes.fromhex("000102030405060708090A0B0C0D0E0F")
    plaintext = bytes.fromhex("00112233445566778899AABBCCDDEEFF")
    print("Ciphertext:", aes_encrypt_block(plaintext, key).hex().upper())
    # Expected: 69C4E0D86A7B0430D8CDB78070B4C55A
