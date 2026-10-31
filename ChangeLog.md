# ChangeLog

All notable changes to the `erikespinoza/homebrew-tap` repository will be documented in this file.

## [2026.10.30] - Stagger and Jitter Workflow Cron Schedules

### Changed
- **Staggered Cron Timing**: Jittered weekly workflow schedules away from the top-of-the-hour (`:00`) and Sunday midnight congestion to reduce shared runner queue delays and avoid runner stampedes:
  - `rebuild-keymaster.yml`: Tuesday at 04:37 UTC (`37 4 * * 2`)
  - `rebuild-huproxyclient.yml`: Thursday at 05:19 UTC (`19 5 * * 4`)
  - `update-wireproxy.yml`: Saturday at 03:43 UTC (`43 3 * * 6`)

## [2026.10.30] - Add Wireproxy Formula & Upstream Release Updater

### Added
- **`Formula/wireproxy.rb`**: Pre-built binary formula for `wireproxy` supporting macOS Apple Silicon (`darwin/arm64`), macOS Intel (`darwin/amd64`), Linux AMD64 (`linux/amd64`), and Linux ARM64 (`linux/arm64`), consuming official releases from `windtf/wireproxy`.
- **`.github/workflows/update-wireproxy.yml`**: Scheduled weekly workflow (and manual dispatch) to track official GitHub releases from `windtf/wireproxy`, download `checksums.txt`, update `Formula/wireproxy.rb` with verified SHA-256 hashes, and commit with `tap-formula-update` concurrency control.
- **`README.md`**: Updated documentation and installation commands for `wireproxy`.

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
