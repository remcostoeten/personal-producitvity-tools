# Define the site2, site, port, and cc aliases
Set-Alias -Name site2 -Value 'cd C:\sites'
Set-Alias -Name site -Value 'cd C:\Users\Remco\sites'
Set-Alias -Name port -Value 'cd C:\Users\Remco\sites\portfolio'
Set-Alias -Name cc -Value 'Clear-Host'
Set-Alias -Name xx -Value 'Exit'
Set-Alias -Name open -Value 'explorer .'
Set-Alias -Name "open rs" -Value { Set-Location -Path "C:\Users\Remco\sites\remcostoeten.com"; code . }

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
