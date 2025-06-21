@echo off
:: This script opens an elevated Command Prompt in the current directory.
powershell -NoProfile -Command "Start-Process cmd.exe -ArgumentList '/k pushd %cd%' -Verb RunAs"
