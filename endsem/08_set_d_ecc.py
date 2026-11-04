"""Set D Q2: short ECC encryption demo for learning and exam practice."""

# Small toy curve: y^2 = x^3 + 2x + 2 (mod 17), with generator G=(5, 1).
# Tiny parameters keep the example readable; they are not secure for real use.
p, a = 17, 2
G = (5, 1)

def add(P, Q):
    if P is None: return Q
    if Q is None: return P
    x1, y1 = P
    x2, y2 = Q
    if x1 == x2 and (y1 + y2) % p == 0: return None
    if P == Q:
        slope = (3 * x1 * x1 + a) * pow(2 * y1, -1, p)
    else:
        slope = (y2 - y1) * pow(x2 - x1, -1, p)
    slope %= p
    x3 = (slope * slope - x1 - x2) % p
    y3 = (slope * (x1 - x3) - y1) % p
    return x3, y3


def multiply(k, P):
    result = None
    while k:
        if k % 2: result = add(result, P)
        P = add(P, P)
        k //= 2
    return result


message = b"Secure Transactions"
private_key, r = 5, 7             # d is private; r is temporary
public_key = multiply(private_key, G)  # Q = dG
R = multiply(r, G)                     # sender's temporary public point
shared = multiply(r, public_key)       # sender computes rQ

# Toy encryption: XOR with the shared point's x-coordinate.
ciphertext = bytes(byte ^ shared[0] for byte in message)

# Receiver computes dR, which is the same shared point as rQ.
receiver_shared = multiply(private_key, R)
plaintext = bytes(byte ^ receiver_shared[0] for byte in ciphertext)

print("Public key Q:", public_key)
print("Ciphertext (hex):", ciphertext.hex())
print("Decrypted text:", plaintext.decode())
print("Matches original:", plaintext == message)
