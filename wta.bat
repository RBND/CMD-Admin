@echo off
:: Launches an elevated Windows Terminal in the current directory.
set "TARGET=%CD%"
if /i "%TARGET%"=="%SystemRoot%\System32" set "TARGET=%USERPROFILE%"

powershell -NoProfile -WindowStyle Hidden -Command ^
  "if (Get-Command wt.exe -ErrorAction SilentlyContinue) { Start-Process wt.exe -ArgumentList ('-d \"{0}\"' -f $env:TARGET) -Verb RunAs } else { Start-Process cmd.exe -ArgumentList ('/k pushd \"{0}\"' -f $env:TARGET) -Verb RunAs }"
