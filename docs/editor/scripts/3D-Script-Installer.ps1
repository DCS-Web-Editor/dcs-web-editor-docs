# Initial Functions

## Create log file
$LogFile = ".\DCSWE3D.log"

function Write-Log {
  Param([string]$LogString)
  $Stamp = (Get-Date).ToString("yyyy/MM/dd HH:mm:ss")
  $LogMessage = "$Stamp $LogString"
  Add-Content $LogFile -Value $LogMessage
}

Start-Transcript -Append $LogFile

if (Test-Path $LogFile) {
  Write-Host "Log file $LogFile created successfully." -f Green
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
Write-Host "Testing MissionScripting.lua path..." -f Yellow

$MissionScriptPath = ".\Scripts\MissionScripting.lua"

if (Test-Path "$MissionScriptPath") {
  Write-host "Found the MissionScripting.lua." -f Green
}
else {
  Exit-Script
}

## Get user name to find Saved Games folder
$MyName = [Environment]::UserName
Write-Host "User $MyName found, adding to Saved Games path." -f Green

## Set Saved Games path variable
Write-Host "Testing Saved Games path..." -f Yellow

$SavedGamesPath = "C:\Users\$MyName\Saved Games\DCS.openbeta"

if (Test-Path $SavedGamesPath) {
  Write-Host "Found Saved Games folder at $SavedGamesPath." -f Green
}
else {
  Exit-Script
}

## Check for Scripts folder in DCS.openbeta Saved Games
Write-Host "Checking for Scripts folder in DCS Saved Games..." -f Yellow

### Function for testing the Scripts folder path
function Find-Scripts {
  Test-Path "$SavedGamesPath\Scripts"
}

### Function for creating the Scripts folder and retesting the path
function New-Scripts {
  Write-Host "Creating Scripts folder..." -f Yellow
  New-Item -Path "$SavedGamesPath\Scripts" -ItemType Directory
  New-Item -Path "$SavedGamesPath\Scripts\Hooks" -ItemType Directory
  if (Find-Scripts) {
    Write-Host "Scripts folder successfully created." -f Green
  }
  else {
    Exit-Script
  }
}

### Test for the Scripts folder
if (Find-Scripts) {
  Write-Host "Scripts folder found." -f Green
}
else {
  Write-Host "Scripts folder not found." -f Red
  New-Scripts
}

## Check for the Hooks folder in DCS.openbeta Saved Games
Write-Host "Checking for Hooks folder in DCS Saved Games..." -f Yellow

### Function for testing the Hooks folder path
function Find-Hooks {
  Test-Path "$SavedGamesPath\Scripts\Hooks"
}

### Function for creating the Hooks folder and retesting the path
function New-Hooks {
  Write-Host "Creating Hooks folder..." -f Yellow
  New-Item -Path "$SavedGamesPath\Scripts\Hooks" -ItemType Directory
  if (Find-Hooks) {
    Write-Host "Hooks folder successfully created." -f Green
  }
  else {
    Exit-Script
  }
}

if (Find-Hooks) {
  Write-Host "Hooks folder found." -f Green
}
else {
  Write-Host "Hooks folder not found." -f Red
  New-Hooks
}

# Script file functions

## Download functions
function Get-MissionScripting {
  Write-Host "Downloading MissionScripting.lua..." -f Yellow
  Invoke-WebRequest "https://dcs-web-editor.github.io/dcs-web-editor-docs/editor/scripts/MissionScripting.lua" -OutFile "$MissionScriptPath"
}

function Get-MissionServer {
  Write-Host "Downloading dcs-web-editor-mission-server.lua..." -f Yellow
  Invoke-WebRequest "https://dcs-web-editor.github.io/dcs-web-editor-docs/editor/scripts/dcs-web-editor-mission-server.lua" -OutFile "$SavedGamesPath\Scripts\dcs-web-editor-mission-server.lua"
}

function Get-GUIServer {
  Write-Host "Downloading dcs-web-editor-gui-server.lua..." -f Yellow
  Invoke-WebRequest "https://dcs-web-editor.github.io/dcs-web-editor-docs/editor/scripts/dcs-web-editor-gui-server.lua" -OutFile "$SavedGamesPath\Scripts\Hooks\dcs-web-editor-gui-server.lua"
}

## Functions - verify scripts after download
function Test-MissionScripting {
  Write-Host "Verifying MissionScripting.lua download..." -f Yellow
  $ScriptToken = Get-Content "$MissionScriptPath" | Select-String "package.path"
  $MissionScriptVariable = 'package.path = package.path .. ";.\\LuaSocket\\?.lua"'
  if ($ScriptToken -like $MissionScriptVariable) {
    Write-Host "Verified." -f Green
  }
  else {
    Exit-Script
  }
}

function Test-MissionServer {
  Write-Host "Verifying dcs-web-editor-mission-server.lua download..." -f Yellow
  if (Test-Path "$SavedGamesPath\Scripts\dcs-web-editor-mission-server.lua") {
    Write-Host "Verified." -f Green
  }
  else {
    Exit-Script
  } 
}

function Test-GUIServer {
  Write-Host "Verifying dcs-web-editor-gui-server.lua download..." -f Yellow
  if (Test-Path "$SavedGamesPath\Scripts\Hooks\dcs-web-editor-gui-server.lua") {
    Write-Host "Verified." -f Green
  }
  else {
    Exit-Script
  }
}

# Download the files
Write-Host "Starting file downloads..." -f Yellow

Get-MissionServer
Get-GUIServer
Get-MissionScripting

Test-MissionServer
Test-GUIServer
Test-MissionScripting

#Installation Complete
Write-host "Installation Complete." -f Green
Read-Host -Prompt "Press Enter to exit Powershell."
exit
