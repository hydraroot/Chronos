# Publish Chronos 1.0 to GitHub / Publicar Chronos 1.0 en GitHub

Official repository: <https://github.com/hydraroot/Chronos>

This package contains the repository files at its root. It does not contain a `.git` folder and does not upload anything by itself. Chronos 1.0 is the first public baseline; use it as the starting point for future work.

## English

1. Install [Git for Windows](https://git-scm.com/download/win), if needed.
2. Open PowerShell and clone your repository:

   ```powershell
   git clone https://github.com/hydraroot/Chronos.git
   cd Chronos
   ```

3. Extract the contents of this ZIP into the cloned `Chronos` folder. Allow the files to be added or replaced. Do not delete the hidden `.git` folder.
4. Review the changes, then commit and push:

   ```powershell
   git add -A
   git status
   git commit -m "Publish Chronos 1.0 baseline"
   git push -u origin HEAD
   ```

5. Create and push the baseline release tag:

   ```powershell
   git tag -a v1.0 -m "Chronos 1.0 - first public baseline"
   git push origin v1.0
   ```

6. Refresh <https://github.com/hydraroot/Chronos> and verify that both README files, `LICENSE`, `NOTICE`, `CITATION.cff`, and all four screenshots are visible. Also verify `CODE_SIGNING_POLICY.md`, `PRIVACY.md`, and the `.github/workflows/` files. The `windows-release.yml` workflow can build and publish the explicitly unsigned `Chronos-1.0-Windows-x64-unsigned.zip` from the `v1.0` tag. Do not describe it as signed. Review `CODE_SIGNING_POLICY.md` and `docs/SIGNPATH_ONBOARDING.md` before applying to SignPath Foundation.

If Git reports that the remote repository contains commits that are not in your local clone, do not force-push. Pull and reconcile those changes first.

## Español

1. Instalá [Git for Windows](https://git-scm.com/download/win), si todavía no lo tenés.
2. Abrí PowerShell y cloná tu repositorio:

   ```powershell
   git clone https://github.com/hydraroot/Chronos.git
   cd Chronos
   ```

3. Extraé el contenido de este ZIP dentro de la carpeta `Chronos` clonada. Permití agregar o reemplazar los archivos. **No borres la carpeta oculta `.git`**.
4. Revisá los cambios, guardalos y subilos:

   ```powershell
   git add -A
   git status
   git commit -m "Publicar base de Chronos 1.0"
   git push -u origin HEAD
   ```

5. Creá y subí la etiqueta de la versión base:

   ```powershell
   git tag -a v1.0 -m "Chronos 1.0 - primera base publica"
   git push origin v1.0
   ```

6. Actualizá <https://github.com/hydraroot/Chronos> y comprobá que aparezcan ambos README, `LICENSE`, `NOTICE`, `CITATION.cff` y las cuatro capturas. El workflow `windows-release.yml` puede compilar y publicar `Chronos-1.0-Windows-x64-unsigned.zip`, claramente identificado como no firmado, desde la etiqueta `v1.0`. No lo presentes como firmado. Revisá `CODE_SIGNING_POLICY.md` y `docs/SIGNPATH_ONBOARDING.md` antes de solicitar la firma a SignPath Foundation.

Si Git informa que el repositorio remoto tiene commits que no están en tu copia local, no uses `--force`: primero traé y conciliá esos cambios.
