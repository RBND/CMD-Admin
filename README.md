
# 🛠️ CMDA Launcher

This project provides a simple way to launch a **Command Prompt window with administrator privileges** from any File Explorer address bar using a custom keyword (`cmda`), with the terminal starting in the current directory.  

Just like typing `cmd`, but as admin.

---

## 🚀 Installation Instructions

### 1. 📁 Create a Folder
Save all files in a folder named:
```
C:\Scripts
```

### 2. 📝 Set Up an Environment Variable
Create a new **User Environment Variable**:

To be able to launch the script using a keyword like `cmda` from any File Explorer address bar:

1. Press `Windows + S` and search for **Environment Variables**.
2. Click **Edit the system environment variables**.
3. In the **System Properties** window, click the **Environment Variables** button.
4. Under **System variables**, find and click the entry **Path** to highlight it.
5. Click **Edit**.
6. Then click **New**, and enter the full path to your script folder, for example: `C:\Scripts\`
7. Click **OK** to save.
8. Click **OK** on all other open dialogs to close them.

### 3. ✅ Launch It!
In any File Explorer window:
- Click the address bar
- Type `cmda` and press **Enter**
- It will launch **Command Prompt as Admin**, pointed at the current directory

---

## ⚙️ How It Works

- `cmda.bat` captures the current directory and launches **Windows Terminal** as admin, using the Command Prompt profile.
- If the profile GUID is not hardcoded, it auto-detects it from your Windows Terminal `settings.json`.

---

## 🧪 Troubleshooting

### 🧩 Profile GUID Detection Issues

If you're using PowerShell to **automatically detect the Command Prompt profile GUID** in `settings.json`, here’s how to troubleshoot common issues:

#### ✅ Check PowerShell Version
Ensure you are using **PowerShell 5.1 or higher**:
```powershell
$PSVersionTable.PSVersion
```

#### ✅ Use Correct Path to `settings.json`
The file should be located at:
```
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```
Run this to confirm:
```powershell
Test-Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
```

#### ✅ Use Safe JSON Parsing (No `-Raw`)
If `-Raw` causes issues in older PowerShell versions, use:
```powershell
$s = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$j = Get-Content $s | Out-String | ConvertFrom-Json
$p = $j.profiles.list | Where-Object { $_.name -eq 'Command Prompt' }
$p.guid
```

#### ❌ Getting `DriveNotFound` or `$env` Not Recognized?
Make sure **double quotes** are used around the whole `-Command` and **escaped properly** inside a batch script:
```bat
powershell -NoProfile -Command "$s=\"$env:LOCALAPPDATA\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json\"; $j=Get-Content $s | Out-String | ConvertFrom-Json; $p=$j.profiles.list | Where-Object { $_.name -eq 'Command Prompt' }; $p.guid"
```

#### 📋 Manually Find the GUID
If automation fails, manually copy the Command Prompt GUID from `settings.json`. Look for:
```json
{
  "name": "Command Prompt",
  "guid": "{...}"
}
```
Then hardcode the GUID in your script.

---
```bat
pause
```

This will keep the terminal open until you press a key.
