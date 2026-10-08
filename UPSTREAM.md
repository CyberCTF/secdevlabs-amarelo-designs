# Upstream

| | |
| --- | --- |
| Project | secDevLabs (Globo.com) |
| Repository | https://github.com/globocom/secDevLabs |
| App | `owasp-top10-2021-apps/a8/amarelo-designs` |
| Version | master (secDevLabs has no releases) |
| Commit | 10be438496e928c66567749f0aaf0bb976052bc9 |
| Licence | BSD-3-Clause |

The app folder [`owasp-top10-2021-apps/a8/amarelo-designs`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a8/amarelo-designs) of that commit is vendored unchanged, without its Git history,
split so that each part sits in the build folder of the machine that uses it:

| Upstream path (in the app folder) | Here |
| --- | --- |
| everything | `build/app/app/` |

Each `build/<machine>/Dockerfile` says in its header comment how it differs from upstream:

- `build/app/`: upstream's `deployments/Dockerfile` with the base image pinned to `python:3.11` (upstream takes the latest 3.x), the unpinned requirements (`flask`) resolved as of 2023-04-01 (`pip --uploaded-prior-to`), i.e. Flask 2.2 and Werkzeug 2.2, and the application copied into the image (upstream's compose file mounts it from the host). With the versions current at the secDevLabs commit (Werkzeug 3), the admin login fails: `app.py` passes a bytes value to `set_cookie()`, and Werkzeug 2.3 and later raise `TypeError: cannot use a string pattern on a bytes-like object`.
- Upstream also publishes port 9051 for the bind shell its walkthrough opens. The lab does not declare it, because nothing listens there until the exploit and Isoloom waits for every declared port: open a reverse shell instead, or connect from inside the lab network.

To update, replace the vendored folders with a newer secDevLabs commit, then change this file.
