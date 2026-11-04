@rem Copyright 2026 WDS657 - SPDX-License-Identifier: Apache-2.0
@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title Chronos 1.0 - Compilacion segura

echo ================================================
echo       CHRONOS 1.0 - COMPILACION ONEDIR
echo ================================================
echo.
echo Esta compilacion NO utiliza el modo --onefile.
echo Mantenga toda la carpeta dist\Chronos junta.
echo No requiere ejecutar como administrador.
echo.

where py >nul 2>nul
if %errorlevel%==0 (
  set "PY=py -3"
) else (
  set "PY=python"
)

%PY% -c "import sys; print('Python', sys.version.split()[0]); raise SystemExit(0 if sys.version_info >= (3,10) else 1)"
if errorlevel 1 goto version_error
%PY% -c "import tkinter"
if errorlevel 1 goto tkinter_error

%PY% -m pip install --user -r requirements.txt pyinstaller
if errorlevel 1 goto error

rem Avoid removing files while a previous instance is still running.
tasklist /FI "IMAGENAME eq Chronos.exe" 2>nul | find /I "Chronos.exe" >nul
if not errorlevel 1 (
  echo.
  echo ATENCION: Chronos.exe sigue ejecutandose.
  echo Cerralo desde el icono de la bandeja: clic derecho ^> Salir.
  pause
  exit /b 2
)

if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
if exist Chronos.spec del /q Chronos.spec

%PY% -m PyInstaller --noconfirm --clean --onedir --windowed --noupx --name "Chronos" --icon "chronos.ico" --version-file "chronos_version.txt" ^
  --add-data "chronos.ico;." ^
  --add-data "chronos_icon.png;." ^
  --add-data "chronos_tray.png;." ^
  --collect-all PIL ^
  --hidden-import PIL._tkinter_finder ^
  chronos.py
if errorlevel 1 goto error

if not exist "dist\Chronos\Chronos.exe" goto error

echo.
echo ================================================
echo COMPILACION TERMINADA
echo Ejecutable: dist\Chronos\Chronos.exe
echo IMPORTANTE: no mover Chronos.exe fuera de su carpeta.
echo Mantener tambien la carpeta _internal y los demas archivos.
echo ================================================
explorer "%CD%\dist\Chronos"
pause
exit /b 0

:version_error
echo.
echo ERROR: Se necesita Python 3.10 o posterior.
pause
exit /b 1

:tkinter_error
echo.
echo ERROR: Esta instalacion de Python no incluye Tcl/Tk (tkinter).
echo Reinstala Python desde python.org y habilita Tcl/Tk.
pause
exit /b 1

:error
echo.
echo ERROR: No se pudo generar Chronos.
echo Revisa los mensajes anteriores.
pause
exit /b 1
