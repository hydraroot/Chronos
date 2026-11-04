# SignPath Foundation onboarding checklist

This is the project-side preparation checklist. It does not claim that Chronos has been accepted or that any file is signed.

## Before applying

- [ ] Publish the public repository: https://github.com/hydraroot/Chronos
- [ ] Publish the first release in the same portable ZIP form intended for signing. The initial release is explicitly marked **unsigned**.
- [ ] Confirm the repository is owned and maintained by `hydraroot` / WDS657.
- [ ] Enable MFA on the GitHub account and, once created, the SignPath account.
- [ ] Keep `CODE_SIGNING_POLICY.md`, `PRIVACY.md`, and this documentation available from the repository homepage.
- [ ] Ensure all source code and build scripts maintained by this project are in the public repository.

## Apply

Use the official application page: https://signpath.org/apply

Project details to provide:

- Project name: Chronos
- Repository: https://github.com/hydraroot/Chronos
- Baseline release: 1.0 (`v1.0`)
- License: Apache License 2.0
- Platform/artifact: Windows 10/11 x64 portable PyInstaller `onedir` ZIP
- Project maintainer: WDS657 (`@hydraroot`)
- Project functionality: floating multi-timer, always-on-top windows, adjustable transparency, audio alarms, tray integration, bilingual interface, and local history.
- Privacy: see `PRIVACY.md`; Chronos does not transmit user data during normal operation.

Acceptance is decided by SignPath Foundation. A public repository and release do not guarantee approval; reputation, maintenance, transparency, and compliance are assessed by SignPath.

## After acceptance

1. Configure `GitHub.com` as the trusted build system in SignPath and link the Chronos project to this repository.
2. Install the SignPath GitHub App and grant access to this repository if required by the SignPath audit integration.
3. Upload a sample release ZIP to SignPath and generate an artifact configuration. Review it manually; do not sign third-party PyInstaller/Python/Pillow binaries with the Chronos project certificate. The intended target is the Chronos-owned executable only, subject to SignPath's review and configuration rules.
4. Create a signing policy with origin verification restricted to the release tag/branch workflow and manual approval.
5. Store the SignPath API token as the protected GitHub Actions secret `SIGNPATH_API_TOKEN`. Store the organization ID as the repository Actions variable `SIGNPATH_ORGANIZATION_ID`. Never place these values in source files.
6. Add the SignPath submit-signing-request action to the release workflow using the organization ID, project slug, signing policy slug, and artifact configuration slug issued by SignPath.
7. Require WDS657 to review the source tag and GitHub Actions run and manually approve each signing request.
8. Publish only the artifact returned by the successful signing request as the signed release download. Keep unsigned artifacts clearly labelled until then.

The release workflow currently builds and publishes an unsigned artifact. It intentionally does not contain placeholder signing IDs or a dummy API token. Signing will be enabled only after SignPath approves the project and provides the real configuration values.

## Required team roles

- Author / committer: WDS657 (`@hydraroot`)
- Reviewer of external contributions: WDS657 (`@hydraroot`)
- Signing approver: WDS657 (`@hydraroot`)

All team members with repository or signing access must use MFA. External pull requests must be reviewed before merge. Every signing request must be approved manually.
