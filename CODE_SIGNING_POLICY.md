# Code signing policy

**Project:** Chronos  
**Baseline:** 1.0  
**Repository:** https://github.com/hydraroot/Chronos  
**Project creator and maintainer:** WDS657 (`@hydraroot`)

## Status

As of 2026-11-03, Chronos has **not yet been accepted** into the SignPath Foundation open-source signing program and no Chronos binary in this repository is represented as signed. The first public baseline release is expected to be published unsigned. Do not rely on an unsigned build as proof of publisher identity.

**Intended provider, subject to application and approval: Free code signing provided by SignPath.io, certificate by SignPath Foundation.** If the application is accepted, signed releases will be built from this public repository using GitHub-hosted GitHub Actions runners and submitted to SignPath for manual approval. The public release page and this policy will be updated when signing is active.

## Team roles

Chronos is currently maintained by one project maintainer. Until the team changes, the responsibilities are:

- **Author / committer:** WDS657 (`@hydraroot`) maintains the source code and build scripts.
- **Reviewer:** WDS657 (`@hydraroot`) reviews external pull requests before they are merged.
- **Signing approver:** WDS657 (`@hydraroot`) reviews the source tag and build result and manually approves each signing request.

All people with access to the GitHub repository or SignPath project must enable multi-factor authentication (MFA) on both services before signing is activated. Signing credentials and API tokens must be stored only as protected GitHub Actions secrets; never commit them to this repository.

## What is built and signed

Only Chronos application artifacts built from this repository's source and build scripts by GitHub-hosted workflows may be submitted for signing. Third-party libraries bundled by PyInstaller must not be signed with the project's SignPath certificate. The artifact configuration will be reviewed against an actual release sample before signing is enabled.

Each signed release requires manual approval. Published files must link to the source tag and release. Any rejected or failed signing request remains unsigned and must be labeled as such.

## Privacy

See [PRIVACY.md](PRIVACY.md). This program will not transfer any information to other networked systems unless specifically requested by the user or the person installing or operating it.

## Reporting

Report a suspected signing-policy violation or a tampered Chronos release through the repository's GitHub Security Advisories or Issues. Do not submit private signing tokens, passwords, or personal identification documents in an issue.
