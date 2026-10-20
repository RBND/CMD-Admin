@echo off
:: Launches an elevated Command Prompt in the current directory.
set "TARGET=%CD%"
if /i "%TARGET%"=="%SystemRoot%\System32" set "TARGET=%USERPROFILE%"

powershell -NoProfile -WindowStyle Hidden -Command ^
  "Start-Process cmd.exe -ArgumentList ('/k pushd \"{0}\"' -f $env:TARGET) -Verb RunAs"
