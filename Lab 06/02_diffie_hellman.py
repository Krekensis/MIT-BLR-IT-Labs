"""Lab 06 Q2: create and check a shared Diffie-Hellman secret."""

# Small public values keep the arithmetic easy to follow (not secure for real use).
p = 23
g = 5
alice_private = 6
bob_private = 15

alice_public = pow(g, alice_private, p)
bob_public = pow(g, bob_private, p)

alice_secret = pow(bob_public, alice_private, p)
bob_secret = pow(alice_public, bob_private, p)

print("Alice's public value:", alice_public)
print("Bob's public value:", bob_public)
print("Alice's shared secret:", alice_secret)
print("Bob's shared secret:  ", bob_secret)
print("Secrets match:", alice_secret == bob_secret)
print("Note: Diffie-Hellman shares a secret; it does not sign messages.")
