# ChangeLog

All notable changes to the `erikespinoza/homebrew-tap` repository will be documented in this file.

## [2026.10.30] - Concurrency Control & Bounded Push Retries

### Added
- **Job Concurrency Serialization**: Added `tap-formula-update` concurrency group with `cancel-in-progress: false` across workflows to queue parallel release update jobs cleanly.
- **Bounded Push Retries**: Replaced direct `git push` with a bounded 3-attempt loop performing `git pull --rebase origin main` before pushing to ensure zero race-condition failures.

## [2026.10.30] - Commit SHA Tracking & Build Dependency Fixes

### Added
- **Exact Commit SHA Tracking**: Formulae now track the upstream Git commit SHA via `# commit: <sha>`. Cron workflows query the GitHub API and only trigger rebuilds if the commit SHA has actually changed or if forced.
- **Linux Build Dependencies**: Added `pkg-config`, `libudev-dev`, and `libpcsclite-dev` installation step on Linux runners in `rebuild-keymaster.yml` to resolve Cgo build requirements for smartcard and HID handling.

## [2026.10.30] - Initial Tap Scaffolding

### Added
- **`Formula/keymaster.rb`**: Pre-built binary formula for Keymaster client supporting macOS Apple Silicon (`darwin/arm64`) and Linux (`linux/amd64`), tracking upstream `Cloud-Foundations/keymaster:master`.
- **`Formula/huproxyclient.rb`**: Pre-built binary formula for `huproxyclient` supporting macOS Apple Silicon (`darwin/arm64`) and Linux (`linux/amd64`), tracking `erikespinoza/huproxy:master`.
- **`.github/workflows/rebuild-keymaster.yml`**: Automated GitHub Actions workflow using native runners (`macos-latest` and `ubuntu-latest`) to build, release, and auto-update the Keymaster formula when upstream commits change.
- **`.github/workflows/rebuild-huproxyclient.yml`**: Automated GitHub Actions workflow using native runners (`macos-latest` and `ubuntu-latest`) to build, release, and auto-update the `huproxyclient` formula when upstream commits change.
- **`README.md`**: Tap usage instructions, installation commands, and maintenance runbook.
