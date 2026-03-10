# Periodical Renovate Container

![GitHub License](https://img.shields.io/github/license/anthochamp/container-periodical-renovate?style=for-the-badge)
![GitHub Release](https://img.shields.io/github/v/release/anthochamp/container-periodical-renovate?style=for-the-badge&color=457EC4)
![GitHub Release Date](https://img.shields.io/github/release-date/anthochamp/container-periodical-renovate?style=for-the-badge&display_date=published_at&color=457EC4)

Container images based on [Renovate](https://github.com/renovatebot/renovate), an automated dependency update tool, configured to run periodically at a configurable interval.

## How to use this image

```shell
docker run \
  -e RENOVATE_TOKEN=your-github-token \
  -e RENOVATE_REPOSITORIES="owner/repo" \
  anthochamp/periodical-renovate
```

## Volumes

| Path              | Description                                     |
|-------------------|-------------------------------------------------|
| `/tmp/renovate`   | Working directory (default `RENOVATE_BASE_DIR`) |

## Configuration

This container adds Docker secrets support: append `__FILE` to any environment variable name to read its value from a file (e.g., `RENOVATE_TOKEN__FILE=/run/secrets/renovate_token`).

All environment variables from the official Renovate image are supported. Refer to the [Renovate self-hosted configuration documentation](https://docs.renovatebot.com/self-hosted-configuration/) for the full list.

### RENOVATE_BASE_DIR

**Default**: `/tmp/renovate`

Base directory for Renovate's working files.

**References:**

- <https://docs.renovatebot.com/self-hosted-configuration/\#basedir\>

### RENOVATE_CACHE_DIR

**Default**: `$RENOVATE_BASE_DIR/cache`

Cache directory for Renovate.

**References:**

- <https://docs.renovatebot.com/self-hosted-configuration/\#cachedir\>

### SLEEP_TIMEOUT

**Default**: `30m`

Time to sleep between Renovate runs. Accepts values like `30m`, `1h`, `2h30m`. Uses the `sleep` command format.

## References

- [Renovate documentation](https://docs.renovatebot.com/)
- [Renovate self-hosted configuration](https://docs.renovatebot.com/self-hosted-configuration/)
- [Renovate on GitHub](https://github.com/renovatebot/renovate)
