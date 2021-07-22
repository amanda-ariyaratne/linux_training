import sys
import os
import hashlib

password = str(sys.argv[1])
byte_password = bytes(password, 'utf-8')
salt = os.urandom(16)
dk = hashlib.pbkdf2_hmac('sha512', byte_password, salt, 200000)
print(dk.hex())
