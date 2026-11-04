@rem Copyright 2026 WDS657 - SPDX-License-Identifier: Apache-2.0
@echo off
setlocal EnableExtensions
cd /d "%~dp0"
where py >nul 2>nul
if %errorlevel%==0 (set "PY=py -3") else (set "PY=python")
%PY% -c "import sys; print('Python', sys.version.split()[0]); raise SystemExit(0 if sys.version_info >= (3,10) else 1)"
if errorlevel 1 goto version_error
%PY% -c "import tkinter"
if errorlevel 1 goto tkinter_error
%PY% -c "from PIL import Image, ImageTk" >nul 2>nul
if errorlevel 1 (
  echo Instalando dependencias necesarias para Chronos...
  %PY% -m pip install --user -r requirements.txt
  if errorlevel 1 goto error
)
%PY% chronos.py
if errorlevel 1 goto error
exit /b 0
:version_error
echo.
echo Se necesita Python 3.10 o posterior.
pause
exit /b 1
:tkinter_error
echo.
echo Esta instalacion de Python no incluye Tcl/Tk (tkinter).
echo Reinstala Python desde python.org y habilita Tcl/Tk.
pause
exit /b 1
:error
echo.
echo No se pudo iniciar Chronos.
echo Comprueba la instalacion de Python y las dependencias.
pause
exit /b 1
