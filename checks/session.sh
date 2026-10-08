#!/bin/sh
# The admin login (the default admin / admin) sets a session cookie that is a base64 Python
# pickle, which /user loads back.
set -e
cookie=$(curl -sS -D - -o /dev/null --data 'username=admin&password=admin' http://app:5000/admin | sed -n 's/^[Ss]et-[Cc]ookie: sessionId=\([^;]*\).*/\1/p' | tr -d '"\r')
echo "$cookie" | grep -q '^gAS'
curl -fsS -b "sessionId=$cookie" http://app:5000/user >/dev/null
