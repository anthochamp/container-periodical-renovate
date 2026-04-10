# Periodical Renovate Container Images

Container images based on [Renovate](https://github.com/renovatebot/renovate), an automated dependency update tool, configured to run periodically at a configurable interval.

Sources are available on [GitHub](https://github.com/anthochamp/container-periodical-renovate).

See [README.md](README.md) for full documentation and configuration reference.

## Image tags

- `x.y.z-renovateA.B.C`: Container image version `x.y.z` with Renovate `A.B.C`.
- `edge-renovateA.B.C`: Latest commit build with Renovate `A.B.C`.

**Tag aliases:**

- `x.y-renovateA.B.C`: Latest patch of `x.y` with Renovate `A.B.C`.
- `x-renovateA.B.C`: Latest minor+patch of `x` with Renovate `A.B.C`.
- `x.y.z-renovateA.B`: Version `x.y.z` with latest patch of Renovate `A.B` (only latest container version updated).
- `x.y-renovateA.B`: Latest patch of `x.y` with latest patch of Renovate `A.B`.
- `x-renovateA.B`: Latest minor+patch of `x` with latest patch of Renovate `A.B`.
- `x.y.z-renovateA`: Version `x.y.z` with latest minor+patch of Renovate `A` (only latest container version updated).
- `x.y-renovateA`: Latest patch of `x.y` with latest minor+patch of Renovate `A`.
- `x-renovateA`: Latest minor+patch of `x` with latest minor+patch of Renovate `A`.
- `x.y.z`: Version `x.y.z` with latest Renovate (only latest container version updated).
- `x.y`: Latest patch of `x.y` with latest Renovate.
- `x`: Latest minor+patch of `x` with latest Renovate.
- `renovateA.B.C`: Latest container with Renovate `A.B.C`.
- `renovateA.B`: Latest container with latest patch of Renovate `A.B`.
- `renovateA`: Latest container with latest minor+patch of Renovate `A`.
- `latest`: Latest `x.y.z-renovateA.B.C` tag.
- `edge-renovateA.B`: Latest commit build with latest patch of Renovate `A.B`.
- `edge-renovateA`: Latest commit build with latest minor+patch of Renovate `A`.
- `edge`: Latest `edge-renovateA.B.C` tag.
