# Start
Read-Host "💔💔💔 YOU BROKE IT!  OH NO! 💔💔💔
    `nJust kidding.  
    `nPress any key to continue to remove all Solved Activity folders listed in the target .gitignore by the specified Directory and Module Name"

# Browse for initial location of .gitignore file
$initialLocation = Read-Host -Prompt "Enter initial location of .gitignore file. 
    `nMust be the root directory of the repository, which contains the .git folder. 
    `nPlease format input so the path looks like this:
    `n `"`C:\Users\UserName\DIRECTORY\CONTAINING_FOLDER\HOW_DEEP_IS_IT_THO\fullstack-live-main`"` "
while (-not (Test-Path $initialLocation -PathType Container)) {
    Write-Host "Invalid path, please try again."
    $initialLocation = Read-Host -Prompt "Enter initial location of .gitignore file"
}

# Get folder name to ignore
$folderName = Read-Host "Enter folder name containing target Solved folders to remove from .gitignore (e.g. '03-JavaScript')"
$ignorePath = "01-Class-Content/$folderName/01-Activities/"

# Read .gitignore file
$gitignorePath = Join-Path $initialLocation ".gitignore"
$existingContent = Get-Content $gitignorePath

# Filter lines containing the folder name and "01-Activities/*" path
$updatedContent = @()
$commentFound = $false
$removedCount = 0
$comment = "# ignored by powershell, with love, SJROHRXD"
$updatedComment = "# updated by powershell on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), with love, SJROHRXD"

foreach ($line in $existingContent) {
    if (-not ($line -like "$ignorePath*/Solved")) {
        if ($line -match [regex]::Escape($comment)) {
            $updatedContent += $updatedComment
            $commentFound = $true
        } elseif ($line -notmatch "# updated by powershell on") {
            $updatedContent += $line
        }
    } else {
        Write-Host "Removed '$line' from .gitignore file."
        $removedCount++
    }
}

if (-not $commentFound) {
    $updatedContent += $updatedComment
}

# Write updated content to .gitignore
$updatedContent | Set-Content $gitignorePath

# Display message if no lines were removed or if specified folder name was not found in .gitignore
if ($removedCount -eq 0) {
    Read-Host "Nothing found in $($gitignorePath) under the Module Name $folderName to remove. 
    `nPress any key to admit failure"
}