# Homebrew Tap for Erik Espinoza (`erikespinoza/tap`)

This tap provides pre-built binaries for macOS Apple Silicon (`darwin/arm64`) and Linux (`linux/amd64`).

## Packages Included

| Package | Upstream Source | Description |
| :--- | :--- | :--- |
| **`keymaster`** | [Cloud-Foundations/keymaster](https://github.com/Cloud-Foundations/keymaster) | Keymaster client for short-lived certificate management |
| **`huproxyclient`** | [erikespinoza/huproxy](https://github.com/erikespinoza/huproxy) | HTTP/WebSocket proxy client |
| **`wireproxy`** | [windtf/wireproxy](https://github.com/windtf/wireproxy) | Wireguard client that exposes itself as a socks5/http proxy |

---

## Installation

### 1. Tap the repository
```bash
brew tap erikespinoza/tap
```

### 2. Install packages
```bash
brew install keymaster
brew install huproxyclient
brew install wireproxy
```

### 3. Upgrade packages
```bash
brew update
brew upgrade keymaster huproxyclient wireproxy
```

---

## Architecture & Automated Rebuilds

- **No Local Compilation**: Homebrew downloads pre-compiled native tarballs from GitHub Releases and extracts the executables directly to `$(brew --prefix)/bin`.
- **Automated Tracking of Upstream**:
  - GitHub Actions runs on staggered, off-peak weekly schedules (and can be triggered manually via `Actions` -> `Run workflow` with optional force build/update).
  - For `keymaster` and `huproxyclient`, workflows detect new commits on `master`, execute native builds on GitHub-hosted runners (`macos-latest` for Apple Silicon and `ubuntu-latest` for Linux), generate release archives, publish releases, and update the formulae in `main`.
  - For `wireproxy`, the updater workflow tracks upstream releases from `windtf/wireproxy`, extracts SHA-256 checksums from `checksums.txt`, and updates `Formula/wireproxy.rb` automatically.
