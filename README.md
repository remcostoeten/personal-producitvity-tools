# Autohotkey script

A script with shortcuts. Download Autohotkey first. https://www.autohotkey.com/ and then place `startup.ahk` inside the starutp folder at `C:\Users\Remco\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

# Chocolatey install script

```
`choco install --yes --limit-output $(choco list --local-only --id-only)`
PS C:\Users\Remco\sites\producitvity-tools> choco list --local-only
>>
Chocolatey v1.3.1
chocolatey 1.3.1
chocolatey-compatibility.extension 1.0.0
chocolatey-core.extension 1.4.0
chocolatey-dotnetfx.extension 1.0.1
chocolatey-windowsupdate.extension 1.0.5
docker-desktop 4.19.0
dotnet-7.0-desktopruntime 7.0.5
dotnet-desktopruntime 7.0.5
DotNet4.5.2 4.5.2.20140902
dotnetfx 4.8.0.20220524
Firefox 112.0.2
hamsket-nightly 0.60.7
hyper 3.4.1
KB2919355 1.0.20160915
KB2919442 1.0.20160915
KB2999226 1.0.20181019
KB3033929 1.0.5
KB3035131 1.0.3
KB3063858 1.0.0
nano 7.2.25
nano-win 7.2.25
nodejs 20.1.0
nodejs.install 20.1.0
powertoys 0.68.1
sharex 15.0.0
tor 0.4.7.11
vcredist140 14.34.31938
vim 9.0.1523
vlc 3.0.18
vlc.install 3.0.18
WhatsApp 2.2319.9
31 packages installed.
```

https://chocolatey.org install script.
When reinstalling windows just run choco script instead of the tedious process of installing all your applications one by one.

# Powershell config

Or in my case Hyper.js terminal because ✨ aesthetics✨. Primairly just some personal shortcuts like `commit "message" which is shorthand for `git commit -m "message"`or`catcopy`which copys the content of`cat filename`to boost productivity or aliasses to imitate some unix functions like`touch`

## Installation

This is a config for Powershell with some custom functions and alias Just copy and paste the entire (or parts) of the config in the .ps1 config file which should be located here

```
C:\Users\Remco\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

.Hyper.js goes here `C:\Users\Remco\AppData\Roaming\Hyper\.hyper.js`

or type `notepad $PROFILE` to directly open it.

## Documentation for all the aliasses and functions

````bash
# Define the site2, site, port, and cc aliases
Set-Alias -Name site2 -Value 'cd C:\sites'
Set-Alias -Name site -Value 'cd C:\Users\Remco\sites'
Set-Alias -Name port -Value 'cd C:\Users\Remco\sites\portfolio'
Set-Alias -Name cc -Value 'Clear-Host'

# Define the xx function to exit the PowerShell session
function xx {
    Exit
}

# Define the "open rs" function to open Visual Studio Code in the specified directory
function open-rs {
    Set-Location -Path 'C:\Users\Remco\sites\remcostoeten.com'
    code .
}


# Define the Copy-FileContentToClipboard function to copy file contents to clipboard
function Copy-FileContentToClipboard {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$filename
    )
    if (Test-Path $filename) {
        Get-Content $filename | Set-Clipboard
    }
    else {
        Write-Host "File does not exist."
    }
}

# Create the catcopy alias
New-Alias -Name catcopy -Value Copy-FileContentToClipboard

# Define the New-GitCommit function to create a new Git commit with a message
function New-GitCommit {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$message
    )

    git commit -m "$message"
}

# Create the commit alias
New-Alias -Name commit -Value New-GitCommit```


```bash
function xx {
    Exit
}

# Define the "open rs" function to open Visual Studio Code in the specified directory
function open-rs {
    Set-Location -Path 'C:\Users\Remco\sites\remcostoeten.com'
    code .
}

# Define th e ll alias for listing directory contents
Set-Alias -Name ll -Value ls

# Define the touch function to update file's LastWriteTime or create a new file
Function New-Touch {
    param($filename)
    if (Test-Path $filename) {
        (Get-Item $filename).LastWriteTime = Get-Date
    }
    else {
        New-Item -ItemType File -Path $filename
    }
}

# Create the touch alias
Set-Alias -Name touch -Value New-Touch

# Define the rmrf function to remove files and directories forcefully
Function Remove-Force {
    param($path)
    Remove-Item -Path $path -Recurse -Force
}

# Create the rmrf alias
Set-Alias -Name rmrf -Value Remove-Force

# Define the Open-Explorer function to open File Explorer and select a path
Function Open-Explorer {
    param($path = ".")
    Start-Process explorer.exe -ArgumentList "/select,$((Get-Item -Path $path).FullName)"
}

# Create the open alias
Set-Alias -Name open -Value Open-Explorer

# Define the Copy-FileContentToClipboard function to copy file contents to clipboard
function Copy-FileContentToClipboard {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$filename
    )
    if (Test-Path $filename) {
        Get-Content $filename | Set-Clipboard
    }
    else {
        Write-Host "File does not exist."
    }
}

# Create the catcopy alias
New-Alias -Name catcopy -Value Copy-FileContentToClipboard

# Define the New-GitCommit function to create a new Git commit with a message
function New-GitCommit {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$message
    )

    git commit -m "$message"
}

# Create the commit alias
New-Alias -Name commit -Value New-GitCommit

````
