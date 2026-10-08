# secDevLabs Amarelo Designs

[secDevLabs](https://github.com/globocom/secDevLabs)' [`owasp-top10-2021-apps/a8/amarelo-designs`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a8/amarelo-designs) app, by Globo.com and the
secDevLabs contributors: a Flask design studio site whose admin session cookie is a base64 Python pickle that the server loads back, a Software and Data Integrity Failure (insecure deserialization) leading to remote code execution. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, built from
the vendored app folder (see [UPSTREAM.md](UPSTREAM.md)).

| Machine | Service |
| --- | --- |
| app | Amarelo Designs on port 5000, published on 10008 |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:10008/. Port 9051 of upstream's walkthrough is not published (see UPSTREAM.md): use a reverse shell. The same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM
(`cloud-docker`) or on Kubernetes. Lab guide: the app's
[README](https://github.com/globocom/secDevLabs/blob/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a8/amarelo-designs/README.md), with the attack narrative and the secDevLabs walkthrough.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

BSD-3-Clause, as secDevLabs ([LICENSE](LICENSE)). The third-party software inside the images keeps
its own licence. This application is deliberately vulnerable: keep it isolated.
