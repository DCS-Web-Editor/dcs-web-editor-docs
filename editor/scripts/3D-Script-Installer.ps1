### DCS Web Editor 3D Script Installer by CourtesyFlush
### Contributers: Guillaume

# Initial Functions

## Create log file
$LogFile = ".\3D-Script-Installer.log"

Start-Transcript -Append $LogFile

if (Test-Path $LogFile) {
  Write-Host "Log file $LogFile created successfully." -ForegroundColor Green
}
else {
  Read-Host -Prompt "Log file not created."
  exit
}

## Script failure function
function Exit-Script {
  Read-Host -Prompt "The installer has failed, please ask for help on Discord. Press Enter to exit the installer."
  exit
}

# Set pathing variables

## Test MissionScripting path
Write-Host "Testing MissionScripting.lua path..." -ForegroundColor Yellow

$MissionScriptPath = ".\Scripts\MissionScripting.lua"

if (Test-Path "$MissionScriptPath") {
  Write-host "Found the MissionScripting.lua." -ForegroundColor Green
}
else {
  Exit-Script
}

## Get user name to find Saved Games folder
$MyName = [Environment]::UserName
Write-Host "User $MyName found, adding to Saved Games path." -ForegroundColor Green

## Initialize variables for beta and release paths
$betaPath = "C:\Users\$MyName\Saved Games\DCS.openbeta"
$releasePath = "C:\Users\$MyName\Saved Games\DCS"

## Check for the presence of beta and release directories
$hasBeta = Test-Path $betaPath
$hasRelease = Test-Path $releasePath

## Set the default saved games path and output the appropriate message
if ($hasBeta -or $hasRelease) {
  if ($hasBeta -and $hasRelease) {
    Write-Host "Both DCS.openbeta and DCS folders found, installing in DCS folder." -ForegroundColor Yellow
    $SavedGamesPath = $releasePath
  } elseif ($hasBeta) {
    Write-Host "Found Saved Games folder at $betaPath." -ForegroundColor Green
    $SavedGamesPath = $betaPath
  } else {
    Write-Host "Found Saved Games folder at $releasePath." -ForegroundColor Green
    $SavedGamesPath = $releasePath
  }
} else {
  Write-Host "No DCS Saved Games folder found, exiting script." -ForegroundColor Red
  Exit-Script
}

## Check for Scripts folder in DCS.openbeta Saved Games
Write-Host "Checking for Scripts folder in DCS Saved Games..." -ForegroundColor Yellow

### Function for testing the Scripts folder path
function Find-Scripts {
  Test-Path "$SavedGamesPath\Scripts"
}

### Function for creating the Scripts folder and retesting the path
function New-Scripts {
  Write-Host "Creating Scripts folder..." -ForegroundColor Yellow
  New-Item -Path "$SavedGamesPath\Scripts" -ItemType Directory
  New-Item -Path "$SavedGamesPath\Scripts\Hooks" -ItemType Directory
  if (Find-Scripts) {
    Write-Host "Scripts folder successfully created." -ForegroundColor Green
  }
  else {
    Exit-Script
  }
}

### Test for the Scripts folder
if (Find-Scripts) {
  Write-Host "Scripts folder found." -ForegroundColor Green
}
else {
  Write-Host "Scripts folder not found." -ForegroundColor Red
  New-Scripts
}

## Check for the Hooks folder in DCS.openbeta Saved Games
Write-Host "Checking for Hooks folder in DCS Saved Games..." -ForegroundColor Yellow

### Function for testing the Hooks folder path
function Find-Hooks {
  Test-Path "$SavedGamesPath\Scripts\Hooks"
}

### Function for creating the Hooks folder and retesting the path
function New-Hooks {
  Write-Host "Creating Hooks folder..." -ForegroundColor Yellow
  New-Item -Path "$SavedGamesPath\Scripts\Hooks" -ItemType Directory
  if (Find-Hooks) {
    Write-Host "Hooks folder successfully created." -ForegroundColor Green
  }
  else {
    Exit-Script
  }
}

if (Find-Hooks) {
  Write-Host "Hooks folder found." -ForegroundColor Green
}
else {
  Write-Host "Hooks folder not found." -ForegroundColor Red
  New-Hooks
}

# Script file functions

## Download functions
function Get-MissionScripting {
  Write-Host "Downloading MissionScripting.lua..." -ForegroundColor Yellow
  Invoke-WebRequest "https://dcs-web-editor.github.io/dcs-web-editor-docs/editor/scripts/MissionScripting.lua" -OutFile "$MissionScriptPath"
}

function Get-MissionServer {
  Write-Host "Downloading dcs-web-editor-mission-server.lua..." -ForegroundColor Yellow
  Invoke-WebRequest "https://dcs-web-editor.github.io/dcs-web-editor-docs/editor/scripts/dcs-web-editor-mission-server.lua" -OutFile "$SavedGamesPath\Scripts\dcs-web-editor-mission-server.lua"
}

function Get-GUIServer {
  Write-Host "Downloading dcs-web-editor-gui-server.lua..." -ForegroundColor Yellow
  Invoke-WebRequest "https://dcs-web-editor.github.io/dcs-web-editor-docs/editor/scripts/dcs-web-editor-gui-server.lua" -OutFile "$SavedGamesPath\Scripts\Hooks\dcs-web-editor-gui-server.lua"
}

## Functions - verify scripts after download
function Test-MissionScripting {
  Write-Host "Verifying MissionScripting.lua download..." -ForegroundColor Yellow
  $ScriptToken = Get-Content "$MissionScriptPath" | Select-String "package.path"
  $MissionScriptVariable = 'package.path = package.path .. ";.\\LuaSocket\\?.lua"'
  if ($ScriptToken -like $MissionScriptVariable) {
    Write-Host "Verified." -ForegroundColor Green
  }
  else {
    Exit-Script
  }
}

function Test-MissionServer {
  Write-Host "Verifying dcs-web-editor-mission-server.lua download..." -ForegroundColor Yellow
  if (Test-Path "$SavedGamesPath\Scripts\dcs-web-editor-mission-server.lua") {
    Write-Host "Verified." -ForegroundColor Green
  }
  else {
    Exit-Script
  } 
}

function Test-GUIServer {
  Write-Host "Verifying dcs-web-editor-gui-server.lua download..." -ForegroundColor Yellow
  if (Test-Path "$SavedGamesPath\Scripts\Hooks\dcs-web-editor-gui-server.lua") {
    Write-Host "Verified." -ForegroundColor Green
  }
  else {
    Exit-Script
  }
}

# Download the files
Write-Host "Starting file downloads..." -ForegroundColor Yellow

Get-MissionServer
Get-GUIServer
Get-MissionScripting

Test-MissionServer
Test-GUIServer
Test-MissionScripting

#Installation Complete
Write-host "Installation Complete." -ForegroundColor Green
Read-Host -Prompt "Press Enter to exit Powershell."
exit
