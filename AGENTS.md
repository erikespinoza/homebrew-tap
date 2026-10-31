# Agent Guidelines & Operational Rules

## 1. Scheduled Workflows & CI/CD Cron Rules (Courteous Resource Usage)

When authoring or updating scheduled workflows (e.g., GitHub Actions crons):
- **Stagger and Jitter Schedules**: Never schedule jobs at the top of the hour (`:00`), half-hour (`:30`), or at midnight (`00:00`), as these times experience severe traffic spikes and runner queue delays on shared free CI/CD infrastructure.
- **Select Arbitrary Off-Peak Minutes**: Use arbitrary, non-round minutes (e.g., `19`, `37`, `43`) during off-peak morning UTC hours (e.g., `03:00` - `05:00` UTC).
- **Distribute Across Days**: When multiple scheduled workflows exist within a repository, distribute their execution across distinct days of the week (e.g., Tuesday, Thursday, Saturday) rather than clustering them on Sundays or midnight.
- **Respect Concurrency Controls**: Ensure workflows that commit to shared branches serialize execution with concurrency groups (e.g., `tap-formula-update`) and use bounded rebase-retry loops.

## 2. Documentation Synchronization
- Adhere to the repository's 4 C's (Clear, Concise, Crisp, Consistent).
- Keep `README.md` and `ChangeLog.md` synchronized in lockstep with all formula and workflow modifications.
