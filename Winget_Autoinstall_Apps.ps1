# Ensure winget is available on the system
$wingetInstalled = Get-Command winget -ErrorAction SilentlyContinue
if (-not $wingetInstalled) {
    Write-Host "winget is not installed on this system. Please install the Windows Package Manager first."
    exit
}

# List of applications to install
$applications = @(
    "Spotify.Spotify",
    "Google.Chrome",
    "ElectronicArts.EADesktop",
    "Ubisoft.UbisoftConnect",
    "Valve.Steam",
    "EpicGames.EpicGamesLauncher",
    "Discord.Discord",
    "TeamSpeakSystems.TeamSpeakClient.Beta.6",
    "JDownloader.JDownloader2",
    "RustDesk.RustDesk"
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