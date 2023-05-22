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
