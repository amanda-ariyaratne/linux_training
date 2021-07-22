import sys
import os
import hashlib

password = str(sys.argv[1])
byte_password = bytes(password, 'utf-8')
dk = hashlib.pbkdf2_hmac('sha512', byte_password, os.urandom(16), 200000)
print(dk.hex())
