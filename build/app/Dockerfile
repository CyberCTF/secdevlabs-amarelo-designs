# Upstream's deployments/Dockerfile with these changes: the base image is pinned to python:3.11
# (upstream: python:3, i.e. latest 3.x); the requirements are copied from app/app/ (upstream's
# build context is the app folder) and, being unpinned (`flask`), resolved as of 2023-04-01
# (pip --uploaded-prior-to, after a pip upgrade that provides it), i.e. Flask 2.2 and
# Werkzeug 2.2: from Werkzeug 2.3 on, app.py's set_cookie() with a bytes value fails with
# "TypeError: cannot use a string pattern on a bytes-like object", so the login is broken with
# the versions current at the secDevLabs commit; and the application is copied into the image,
# where upstream's compose file mounts ../app/ on /app.
FROM docker.io/library/python:3.11
WORKDIR /app
ADD app/app/requirements.txt /app/requirements.txt
# Consertando a build, instalando o pacote netcat-traditional ao invés de `netcat`
RUN apt-get update && apt-get -y install netcat-traditional && apt-get clean 
RUN pip install --upgrade 'pip>=26' && pip install --uploaded-prior-to 2023-04-01T00:00:00Z -r requirements.txt
COPY app/app/ /app/
CMD python app.py
