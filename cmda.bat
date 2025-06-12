@echo off
setlocal EnableDelayedExpansion

:: Use the directory of this script instead of %CD%
set "curDir=%~dp0"

:: Trim trailing backslash (if needed)
if "%curDir:~-1%"=="\" set "curDir=%curDir:~0,-1%"

:: Get GUID of Command Prompt profile from Windows Terminal
for /f "delims=" %%G in ('powershell -NoProfile -Command "($j = Get-Content \"$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json\" | Out-String | ConvertFrom-Json).profiles.list | Where-Object { $_.name -eq 'Command Prompt' } | ForEach-Object { $_.guid }"') do (
    set "guid=%%G"
)

if not defined guid (
    echo [ERROR] Could not find Command Prompt profile GUID.
    pause
    exit /b 1
)

:: Launch Terminal with Command Prompt profile and proper path
powershell -Command "Start-Process wt.exe -Verb RunAs -ArgumentList '-p','!guid!','-d','!curDir!'"

endlocal
