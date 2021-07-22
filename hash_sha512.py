import sys
import os
import hashlib

password = str(sys.argv[1])
salt = os.urandom(16)
hash_value = hashlib.sha512(salt + password.encode())
print(hash_value.hexdigest())
