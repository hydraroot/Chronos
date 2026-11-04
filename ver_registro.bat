@rem Copyright 2026 WDS657 - SPDX-License-Identifier: Apache-2.0
@echo off
setlocal
set "LOG=%APPDATA%\Chronos\chronos.log"
if not exist "%LOG%" (
  echo Todavia no existe el registro: "%LOG%"
  echo Abri Chronos al menos una vez y vuelve a ejecutar este archivo.
  pause
  exit /b 1
)
notepad "%LOG%"
