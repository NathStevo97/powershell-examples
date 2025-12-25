#
# Variables
#

$sectionBreak = "=============================="
$subSectionBreak = "------------------------------"

# Local Directories
$source = "C:\Users\natst\Documents\Programming\powershell-examples\Directory_Syncing\OldDir"
$target = "C:\Users\natst\Documents\Programming\powershell-examples\Directory_Syncing\NewDir"

# USB Directory - Uncomment below two lines and comment line three if transferring to a USB
#$targetLetter = volume | ? drivetype -eq removable | % driveletter # Auto-Find USB Drive Letter
#$target="${targetLetter}:\"

#
# Functions
#

# List Files in Given Directory
function listFiles ($path) {
    Get-ChildItem -Path $path -File
}

# Get Dynamic List of Files to Copy
function getFilesToCopy ($sourceFiles, $targetFiles) {

    $diff = Compare-Object `
        -ReferenceObject $sourceFiles `
        -DifferenceObject $targetFiles `
        -Property Name `
        -PassThru |
        Where-Object { $_.SideIndicator -eq "<=" }

    if (-not $diff) {
        Write-Host "No Files to Transfer" -ForegroundColor green
        return $null
    }

    # Show Files to Transfer
    Write-Host "Files to Transfer:" -ForegroundColor green

    $diff | ForEach-Object { Write-Host $_.Name -ForegroundColor yellow }

    return $diff
}


# Copy Files
function copyFiles ($sourceFiles) {

    $totalFiles = $sourceFiles.Count
    $totalBytes = ($sourceFiles | Measure-Object Length -Sum).Sum

    $filesCopied = 0
    $bytesCopied = 0

    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

    foreach ($file in $sourceFiles) {

        $filesCopied++

        $destination = Join-Path $target $file.Name

        # Copy the file
        Copy-Item -Path $file.FullName -Destination $destination -Force

        # Update counters AFTER file completes
        $bytesCopied += $file.Length

        # Calculate progress
        $percentComplete = ($bytesCopied / $totalBytes) * 100

        $elapsedSeconds = $stopwatch.Elapsed.TotalSeconds
        $bytesPerSecond = if ($elapsedSeconds -gt 0) {
            $bytesCopied / $elapsedSeconds
        } else {
            0
        }

        $remainingSeconds = if ($bytesPerSecond -gt 0) {
            ($totalBytes - $bytesCopied) / $bytesPerSecond
        } else {
            0
        }

        # Display progress
        Write-Progress `
            -Activity "Copying files" `
            -Status ("File {0}/{1}: {2} — ETA {3:mm\:ss}" -f `
                $filesCopied, `
                $totalFiles, `
                $file.Name, `
                ([TimeSpan]::FromSeconds($remainingSeconds))) `
            -PercentComplete $percentComplete
    }

    $stopwatch.Stop()

    Write-Progress -Activity "Copying files" -Completed
}


# Get source file list
$sourceFiles = listFiles $source

# Get target file list - returns null if empty target directory
$targetFiles = listFiles $target

# Start Script Debug
Write-Host $sectionBreak -ForegroundColor cyan

Write-Host "Start Directory Syncing Script" -ForegroundColor cyan

Write-Host $sectionBreak -ForegroundColor cyan

try {

    # If Target Directory is Empty, Copy All Files from Source to Target

    if ($null -eq $targetFiles) {

        Write-Host "Target Directory Empty - Transferring All Files" -ForegroundColor green

        Write-Host $subSectionBreak -ForegroundColor cyan

        copyFiles $sourceFiles

    }

    # If Target Directory Not Empty, Identify Differences and Copy Only Those Files
    else {

        # Identify file content differences for target and source directories

        Write-Host "Target Directory Not Empty - Identifying Files to Transfer" -ForegroundColor green

        Write-Host $subSectionBreak -ForegroundColor cyan

        $filesToCopy = getFilesToCopy $sourceFiles $targetFiles

        Write-Host $subSectionBreak -ForegroundColor cyan

        if ($null -ne $filesToCopy) {

            Write-Host "Transferring Required Files" -ForegroundColor green

            Write-Host $subSectionBreak -ForegroundColor cyan

            copyFiles $filesToCopy

        }

        else {

            Write-Host "No Files Require Transfer - Exiting in 5 seconds" -ForegroundColor green

            Write-Host $sectionBreak -ForegroundColor cyan

            Start-Sleep -s 5
        }

    }

    Write-Host "All Files Transferred - Script will Automatically Exit..." -ForegroundColor green

    Start-Sleep -s 5
}

catch {

    Write-Error -Message "There was an error during the directory sync process." -ErrorAction Stop

}

# End Script Debug
Write-Host $sectionBreak -ForegroundColor cyan

Write-Host "End Directory Syncing Script" -ForegroundColor cyan

Write-Host $sectionBreak -ForegroundColor cyan