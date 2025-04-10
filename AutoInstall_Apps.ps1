<#
.SYNOPSIS
  Automatically installs a set of commonly used Windows applications using winget.

.DESCRIPTION
  This PowerShell script checks if winget (Windows Package Manager) is installed on the system.
  If available, it proceeds to install a predefined list of popular applications silently.
  Each app is installed using winget with minimal user interaction. If an app fails to install,
  the script continues with the next one, logging basic success/failure messages to the console.
#>

# Ensure winget is available on the system
$wingetInstalled = Get-Command winget -ErrorAction SilentlyContinue
if (-not $wingetInstalled) {
    Write-Host "winget is not installed on this system. Please install the Windows Package Manager first."
    exit
}

# List of applications to install
$applications = @(
    "Spotify.Spotify",
    "Zen-Team.Zen-Browser",
    "Mozilla.Firefox",
    "ElectronicArts.EADesktop",
    "Ubisoft.UbisoftConnect",
    "Valve.Steam",
    "EpicGames.EpicGamesLauncher",
    "Discord.Discord",
    "TeamSpeakSystems.TeamSpeakClient.Beta.6",
    "JDownloader.JDownloader2",    
)

# Loop through each application and install
foreach ($app in $applications) {
    Write-Host "Installing $app..."
    try {
        winget install --id $app --silent --accept-source-agreements
        Write-Host "$app installed successfully."
    } catch {
        Write-Host "Failed to install $app. Error: $_"
    }
}
