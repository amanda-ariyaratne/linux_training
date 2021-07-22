import sys
import hashlib

password = str(sys.argv[1])
byte_password = bytes(password, 'utf-8')
dk = hashlib.pbkdf2_hmac('sha512', byte_password, b'Km5d5ivMy8iexuHcZrsD', 200000)
print(dk.hex())
