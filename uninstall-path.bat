@echo off
:: Checks for administrator privileges and removes CMD-Admin from System & User PATH
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -NoProfile -Command "Start-Process cmd.exe -ArgumentList ('/c pushd \"{0}\" && \"{1}\"' -f '%~dp0', '%~nx0') -Verb RunAs"
    exit /b
)

echo Removing CMD-Admin from Windows PATH...
powershell -NoProfile -Command ^
  "$sys = ([Environment]::GetEnvironmentVariable('Path', 'Machine') -split ';' | Where-Object { $_ -notlike '*CMD-Admin*' -and $_.Trim() -ne '' }) -join ';'; " ^
  "[Environment]::SetEnvironmentVariable('Path', $sys, 'Machine'); " ^
  "$usr = ([Environment]::GetEnvironmentVariable('Path', 'User') -split ';' | Where-Object { $_ -notlike '*CMD-Admin*' -and $_.Trim() -ne '' }) -join ';'; " ^
  "[Environment]::SetEnvironmentVariable('Path', $usr, 'User'); " ^
  "Write-Host 'Done! CMD-Admin has been removed from Windows PATH.' -ForegroundColor Green"

echo.
echo Restarting File Explorer to refresh environment variables...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo File Explorer restarted. You are ready to test the Windhawk mod!
timeout /t 3
