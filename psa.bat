@echo off
:: Launches an elevated PowerShell prompt in the current directory.
set "TARGET=%CD%"
if /i "%TARGET%"=="%SystemRoot%\System32" set "TARGET=%USERPROFILE%"

powershell -NoProfile -WindowStyle Hidden -Command ^
  "Start-Process powershell.exe -ArgumentList ('-NoExit -Command Set-Location -LiteralPath ''{0}''' -f ($env:TARGET -replace '''', '''''')) -Verb RunAs"
