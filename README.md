# 🛠️ Terminal Admin Launchers (CMDA / WTA / PSA)

A lightweight suite of quick commands to launch elevated (Administrator) terminal sessions directly from any Windows File Explorer address bar, opened to your active directory.

Just like typing `cmd`, `wt`, or `powershell` in File Explorer—but with administrator privileges!

---

## ⚡ Available Commands

| Command | Launches | Description |
| :--- | :--- | :--- |
| **`cmda`** | **Command Prompt (Admin)** | Launches elevated `cmd.exe` directly in the current directory. |
| **`wta`** | **Windows Terminal (Admin)** | Launches elevated `wt.exe` directly in the current directory. |
| **`psa`** | **PowerShell (Admin)** | Launches elevated `powershell.exe` directly in the current directory. |

---

## 🚀 Installation

### 1. 📁 Save the Scripts
Keep the scripts in a dedicated folder (e.g., your cloned repository folder or `C:\Scripts`).

### 2. 📝 Add to PATH
Add the folder containing the `.bat` files to your system or user `Path` environment variable:

1. Press `Win + S` and search for **Environment Variables**.
2. Click **Edit the system environment variables**.
3. In the **System Properties** dialog, click the **Environment Variables...** button.
4. Under **User variables** (or **System variables**), select **Path** and click **Edit...**.
5. Click **New**, enter the folder path where the scripts are located (e.g. `C:\Scripts` or your repository path), and click **OK**.
6. Click **OK** on all open dialogs to save.

---

## 💻 How to Use

In any File Explorer window:
1. Click the address bar (or press `Alt + D` or `Ctrl + L`).
2. Type **`cmda`**, **`wta`**, or **`psa`** and press **Enter**.
3. Accept the Windows UAC (Administrator) prompt.
4. Your terminal window opens immediately in the active directory!

---

## ⚙️ How It Works

- **Proper UAC Directory Preservation:** By default, Windows resets the working directory of elevated processes to `C:\Windows\System32`. Each script captures the active directory and instructs the elevated shell to open or change to that exact path.
- **Robust Path Quoting:** Safely handles spaces, ampersands (`&`), parentheses (`()`), single quotes, and drive roots (`C:\`).
- **Virtual Folder Fallback:** If launched from a virtual Windows namespace (such as "Home" or "This PC" where no physical folder exists), the scripts gracefully default to your user profile folder (`%USERPROFILE%`) rather than dumping you into `System32`.
- **Flicker-Free Launch:** Scripts execute their elevation trigger silently in the background (`-WindowStyle Hidden`), avoiding unnecessary intermediate window flashes.
