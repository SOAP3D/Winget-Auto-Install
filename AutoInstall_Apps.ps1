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
    "Zen-Team.Zen-Browser",
    "Mozilla.Firefox",
    "ElectronicArts.EADesktop",
    "Ubisoft.UbisoftConnect",
    "Valve.Steam",
    "EpicGames.EpicGamesLauncher",
    "Discord.Discord",
    "TeamSpeakSystems.TeamSpeakClient.Beta.6",
    "Spotify.Spotify",
    "Microsoft.VCRedist.2005.x64",   
    "Microsoft.VCRedist.2005.x86",    
    "Microsoft.VCRedist.2008.x64",    
    "Microsoft.VCRedist.2008.x86",    
    "Microsoft.VCRedist.2010.x64",    
    "Microsoft.VCRedist.2010.x86",    
    "Microsoft.VCRedist.2012.x64",    
    "Microsoft.VCRedist.2012.x86",
    "Microsoft.VCRedist.2013.x64",
    "Microsoft.VCRedist.2013.x86",
    "Microsoft.VCRedist.2015+.x64",   
    "Microsoft.VCRedist.2015+.x86",
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
