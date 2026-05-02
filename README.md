# karunsiri/semaphore

Custom Docker image extending [Semaphore UI](https://github.com/semaphoreui/semaphore) with additional secrets management tools.

## What's included

- [SOPS](https://github.com/getsops/sops) — encrypted secrets management
- [age](https://github.com/FiloSottile/age) — modern file encryption tool (`age` + `age-keygen`)

## Image

```
docker pull karunsiri/semaphore:latest
```

Available on [Docker Hub](https://hub.docker.com/r/karunsiri/semaphore).

## Automated builds

This image is automatically built and pushed to Docker Hub whenever a new stable release is published to [semaphoreui/semaphore](https://github.com/semaphoreui/semaphore). Builds are checked every 6 hours via GitHub Actions.

Each release is tagged with the upstream version (e.g. `v2.17.39`) and `:latest` is updated accordingly.

## Usage

Drop-in replacement for `semaphoreui/semaphore`. All original environment variables and configuration apply.

```yaml
services:
  semaphore:
    image: karunsiri/semaphore:latest
    # ... same config as semaphoreui/semaphore
```

## License

[MIT](LICENSE)
