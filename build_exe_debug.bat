@rem Copyright 2026 WDS657 - SPDX-License-Identifier: Apache-2.0
@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title Chronos 1.0 - Compilacion diagnostica
where py >nul 2>nul
if %errorlevel%==0 (set "PY=py -3") else (set "PY=python")
%PY% -c "import sys; print('Python', sys.version.split()[0]); raise SystemExit(0 if sys.version_info >= (3,10) else 1)"
if errorlevel 1 goto version_error
%PY% -m pip install --user -r requirements.txt pyinstaller
if errorlevel 1 goto error
if exist build_debug rmdir /s /q build_debug
if exist dist_debug rmdir /s /q dist_debug
%PY% -m PyInstaller --noconfirm --clean --onedir --console --noupx --name "Chronos-Diagnostico" --icon "chronos.ico" --version-file "chronos_version.txt" ^
  --distpath dist_debug --workpath build_debug --specpath . ^
  --add-data "chronos.ico;." --add-data "chronos_icon.png;." --add-data "chronos_tray.png;." ^
  --collect-all PIL --hidden-import PIL._tkinter_finder chronos.py
if errorlevel 1 goto error
echo.
echo Ejecutable diagnostico: dist_debug\Chronos-Diagnostico\Chronos-Diagnostico.exe
echo Ejecutalo desde esta carpeta y copia cualquier error que aparezca en consola.
explorer "%CD%\dist_debug\Chronos-Diagnostico"
pause
exit /b 0
:version_error
echo ERROR: Se necesita Python 3.10 o posterior.
pause
exit /b 1
:error
echo Error de compilacion.
pause
exit /b 1
