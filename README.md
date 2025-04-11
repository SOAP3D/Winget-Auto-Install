# Installing some essential apps using winget

This PowerShell script helps you quickly install a list of essential Windows apps using winget.
_______________________________________________________________________________________________

🔧 What it does

- Automatically installs a pre-defined list of applications
- Uses `winget` to install everything silently
- Saves time when setting up a new windows machine

🚀 Quick Start

Just open PowerShell as Administrator `Ctrl + Shift + Enter` and run:

```Powershell
irm "https://soap3d.github.io/Winget-Auto-Install/AutoInstall_Apps.ps1" | iex
