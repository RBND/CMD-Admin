@echo off
for /f "usebackq delims=" %%i in (`powershell -nologo -command "Get-Location | Select-Object -ExpandProperty Path"`) do set curDir=%%i

powershell -NoProfile -Command ^
  "Start-Process wt.exe -ArgumentList '--profile {0caa0dad-35be-5f56-a8ff-afceeeaa6101} -d \"%curDir%\"' -Verb RunAs"
