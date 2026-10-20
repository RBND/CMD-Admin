# 🛠️ Terminal Admin Launchers (File Explorer Aliases)

Launch elevated (Administrator) command prompts, Windows Terminal, PowerShell, or custom shells directly from any Windows File Explorer address bar, opened to your active directory.

Just like typing `cmd`, `wt`, or `powershell` in File Explorer—but with administrator privileges and configurable aliases!

---

## 🚀 Choose Your Flavor

| Feature | 🦅 Windhawk Mod (Recommended) | 📜 Batch Scripts (Standalone) |
| :--- | :--- | :--- |
| **File** | [`explorer-terminal-admin-alias.wh.cpp`](explorer-terminal-admin-alias.wh.cpp) | [`cmda.bat`](cmda.bat), [`wta.bat`](wta.bat), [`psa.bat`](psa.bat) |
| **Configurable Aliases** | ✅ Yes (Change `cmda`, `wta`, `psa`, etc. in GUI) | ❌ Fixed filenames |
| **Setup Required** | ✅ Zero PATH modifications | ⚠️ Requires adding folder to `PATH` |
| **Custom Shells** | ✅ Yes (CMD, WT, PS 5.1, PS 7+, Git Bash, Custom) | ⚠️ Only CMD, WT, PowerShell |
| **Process Overhead** | ⚡ Instant native Win32 `ShellExecuteEx` (`runas`) | 🐢 Spawns hidden PowerShell process |
| **Flicker-Free** | 💎 100% flicker-free | 🔹 Hidden window spawn |
| **Silent UAC Cancel** | ✅ Yes (no error if you hit "No" on UAC) | ❌ Shows error dialog if cancelled |
| **Prerequisites** | [Windhawk](https://windhawk.net/) | None (Native Windows) |

---

## 🦅 Option 1: Windhawk Mod (Configurable Aliases)

The Windhawk mod hooks Explorer's address bar execution directly, letting you customize your aliases through an interactive GUI and eliminating the need for PATH environment variables.

### ⚡ Supported Terminals & Default Aliases

| Default Alias | Terminal Launched | Elevation | Configurable? |
| :--- | :--- | :--- | :--- |
| **`cmda`** | Command Prompt (`cmd.exe`) | Administrator | ✅ Yes |
| **`wta`** | Windows Terminal (`wt.exe`) | Administrator | ✅ Yes |
| **`psa`** | Windows PowerShell 5.1 (`powershell.exe`) | Administrator | ✅ Yes |
| **`pwsha`** | PowerShell 7+ Core (`pwsh.exe`) | Administrator | ✅ Yes |
| **`basha`** | Git Bash (`git-bash.exe`) | Administrator | ✅ Yes |
| *Custom 1* | Any tool (e.g. `code`, `wsl`, `nvim`) | Configurable | ✅ Yes |

### 📥 Installing the Windhawk Mod

1. Ensure **[Windhawk](https://windhawk.net/)** is installed and running.
2. Open Windhawk and click the **three dots (⋮)** in the top right $\rightarrow$ select **Advanced options** $\rightarrow$ **More advanced options** and ensure **Developer mode** is enabled.
3. On the Windhawk main page, click **Create Mod** (or the **+** button).
4. Replace the template contents with the code from [`explorer-terminal-admin-alias.wh.cpp`](explorer-terminal-admin-alias.wh.cpp).
5. Click **Compile** and then **Save & Run**.
6. Switch to the **Settings** tab to change aliases or configure custom commands to your liking!

---

## 📜 Option 2: Classic Batch Scripts (No Windhawk)

If you prefer a portable solution without third-party utilities, you can use the standalone `.bat` scripts:

1. Clone or download this repository.
2. Add the repository folder (or a folder containing the `.bat` files like `C:\Scripts`) to your system or user **`Path`** environment variable:
   - Press `Win + S` $\rightarrow$ search for **Environment Variables** $\rightarrow$ click **Edit the system environment variables**.
   - Click **Environment Variables...** $\rightarrow$ Select `Path` $\rightarrow$ Click **Edit...** $\rightarrow$ Click **New** $\rightarrow$ Enter the folder path.
3. Now type `cmda`, `wta`, or `psa` in File Explorer.

To uninstall/remove the scripts from your PATH later, simply run [`uninstall-path.bat`](uninstall-path.bat).

---

## 💻 How to Use

In any File Explorer window:
1. Click the address bar (or press `Alt + D` or `Ctrl + L`).
2. Type **`cmda`**, **`wta`**, **`psa`**, or your customized alias and press **Enter**.
3. Accept the Windows UAC (Administrator) prompt.
4. Your terminal window opens immediately in the active directory!

> [!TIP]
> You can also pass inline arguments! For example, typing `cmda /k dir` or `wta -p PowerShell` will pass those flags straight into the session.

---

## ⚙️ How Directory Preservation Works

- **Proper UAC Working Directory:** When elevated via Windows UAC (`runas`), processes normally default to `C:\Windows\System32`. Both the Windhawk mod and the scripts capture the active folder path and instruct the elevated shell to open or change to that exact path.
- **Robust Path Quoting:** Safely handles spaces, ampersands (`&`), parentheses (`()`), single quotes, and drive roots (`C:\`).
- **Virtual Folder Fallback:** If launched from a virtual Windows namespace (such as "Home" or "This PC" where no physical folder exists), the launcher gracefully defaults to your user profile folder (`%USERPROFILE%`) rather than dumping you into `System32`.
