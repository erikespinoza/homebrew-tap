# Homebrew Tap for Erik Espinoza (`erikespinoza/tap`)

This tap provides pre-built binaries for macOS Apple Silicon (`darwin/arm64`) and Linux (`linux/amd64`).

## Packages Included

| Package | Upstream Source | Description |
| :--- | :--- | :--- |
| **`keymaster`** | [Cloud-Foundations/keymaster](https://github.com/Cloud-Foundations/keymaster) | Keymaster client for short-lived certificate management |
| **`huproxyclient`** | [erikespinoza/huproxy](https://github.com/erikespinoza/huproxy) | HTTP/WebSocket proxy client |

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
```

### 3. Upgrade packages
```bash
brew update
brew upgrade keymaster huproxyclient
```

---

## Architecture & Automated Rebuilds

- **No Local Compilation**: Homebrew downloads pre-compiled native tarballs from GitHub Releases and extracts the executables directly to `$(brew --prefix)/bin`.
- **Automated Tracking of Master**:
  - GitHub Actions runs weekly (and can be triggered manually via `Actions` -> `Run workflow` with optional force build).
  - It detects new commits on `master`, executes native builds on GitHub-hosted runners (`macos-latest` for Apple Silicon and `ubuntu-latest` for Linux), generates release archives, computes SHA-256 checksums, publishes the GitHub Release, and auto-updates the respective Homebrew formula in `main`.
