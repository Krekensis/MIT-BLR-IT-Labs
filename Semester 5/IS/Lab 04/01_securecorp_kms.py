"""Lab 04 Q1: simple SecureCorp RSA/DH key-management demonstration."""

import secrets
from datetime import datetime
from Crypto.PublicKey import RSA

P = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F
G = 2


class SecureCorpKMS:
    def __init__(self):
        self.systems = {}
        self.audit_log = []

    def log(self, message):
        now = datetime.now().isoformat(timespec="seconds")
        self.audit_log.append(f"{now} - {message}")

    def add_system(self, name):
        self.systems[name] = {
            "rsa_key": RSA.generate(2048),
            "dh_private": secrets.randbelow(P - 2) + 1,
            "active": True,
        }
        self.log(f"Keys generated for {name}")

    def create_channel(self, first_name, second_name):
        first = self.systems[first_name]
        second = self.systems[second_name]
        if not first["active"] or not second["active"]:
            raise PermissionError("Cannot use a revoked system")

        first_public = pow(G, first["dh_private"], P)
        second_public = pow(G, second["dh_private"], P)
        first_secret = pow(second_public, first["dh_private"], P)
        second_secret = pow(first_public, second["dh_private"], P)
        self.log(f"DH channel created: {first_name} <-> {second_name}")
        return first_secret == second_secret

    def revoke(self, name):
        self.systems[name]["active"] = False
        self.log(f"Key revoked for {name}")


kms = SecureCorpKMS()
for system in ("Finance", "HR", "Supply Chain"):
    kms.add_system(system)

print("Finance-HR secure channel:", kms.create_channel("Finance", "HR"))
kms.revoke("Supply Chain")
print("\nAudit log:")
print(*kms.audit_log, sep="\n")
