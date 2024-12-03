# Define the base directory
$BaseDir = Join-Path $env:LocalAppData 'VSCode-Open-Git-Base-Context-Menu'

# Create the base directory if it doesn't exist
if (-not (Test-Path -Path $BaseDir)) {
    New-Item -ItemType Directory -Path $BaseDir | Out-Null
}

# Define the resources subdirectory
$ResourcesDir = Join-Path $BaseDir 'resources'

# Create the resources directory if it doesn't exist
if (-not (Test-Path -Path $ResourcesDir)) {
    New-Item -ItemType Directory -Path $ResourcesDir | Out-Null
}

# URLs of the files to download
$Files = @(
    @{
        Url = 'https://raw.githubusercontent.com/heetbeet/VSCode-Open-Git-Base-Context-Menu/refs/heads/master/VSCodeContextMenuAdd.cmd'
        Destination = Join-Path $BaseDir 'VSCodeContextMenuAdd.cmd'
    },
    @{
        Url = 'https://raw.githubusercontent.com/heetbeet/VSCode-Open-Git-Base-Context-Menu/refs/heads/master/VSCodeContextMenuRemove.cmd'
        Destination = Join-Path $BaseDir 'VSCodeContextMenuRemove.cmd'
    },
    @{
        Url = 'https://raw.githubusercontent.com/heetbeet/VSCode-Open-Git-Base-Context-Menu/refs/heads/master/install-from-github.cmd'
        Destination = Join-Path $BaseDir 'install-from-github.cmd'
    },
    @{
        Url = 'https://raw.githubusercontent.com/heetbeet/VSCode-Open-Git-Base-Context-Menu/refs/heads/master/resources/noshell.vbs'
        Destination = Join-Path $ResourcesDir 'noshell.vbs'
    },
    @{
        Url = 'https://raw.githubusercontent.com/heetbeet/VSCode-Open-Git-Base-Context-Menu/refs/heads/master/resources/vscode.ico'
        Destination = Join-Path $ResourcesDir 'vscode.ico'
    },
    @{
        Url = 'https://raw.githubusercontent.com/heetbeet/VSCode-Open-Git-Base-Context-Menu/refs/heads/master/resources/VSCodeEntryPoint.cmd'
        Destination = Join-Path $ResourcesDir 'VSCodeEntryPoint.cmd'
    }
)

# Download each file
foreach ($File in $Files) {
    Invoke-WebRequest -Uri $File.Url -OutFile $File.Destination -ErrorAction Stop
}

# Run the downloaded VSCodeContextMenuAdd.cmd script
& cmd /c "$(Join-Path $BaseDir 'VSCodeContextMenuAdd.cmd')"
