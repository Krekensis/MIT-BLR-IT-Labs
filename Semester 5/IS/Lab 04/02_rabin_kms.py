"""Lab 04 Q2: educational Rabin key-management service."""

from datetime import datetime, timedelta
from Crypto.Util.number import getPrime


class RabinKMS:
    def __init__(self):
        self.records = {}
        self.audit_log = []

    def log(self, message):
        now = datetime.now().isoformat(timespec="seconds")
        self.audit_log.append(f"{now} - {message}")

    def generate_key(self, facility, bits=256):
        # Rabin requires primes p and q that are 3 modulo 4.
        p = getPrime(bits // 2)
        q = getPrime(bits // 2)
        while p % 4 != 3:
            p = getPrime(bits // 2)
        while q % 4 != 3:
            q = getPrime(bits // 2)

        self.records[facility] = {
            "public_key": p * q,
            "private_key": (p, q),
            "active": True,
            "renewal_date": datetime.now() + timedelta(days=365),
        }
        self.log(f"Generated Rabin key for {facility}")

    def get_public_key(self, facility):
        return self.records[facility]["public_key"]

    def revoke_key(self, facility):
        self.records[facility]["active"] = False
        self.log(f"Revoked key for {facility}")


kms = RabinKMS()
kms.generate_key("Hospital-A")
print("Hospital public key:", kms.get_public_key("Hospital-A"))
kms.revoke_key("Hospital-A")
print("\nRabin: fast encryption but four possible decrypted roots.")
print("RSA  : common in practice and has one padded plaintext.")
print("\nAudit log:")
print(*kms.audit_log, sep="\n")
