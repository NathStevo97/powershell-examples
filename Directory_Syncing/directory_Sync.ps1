$source="C:\Users\natst\Documents\Programming\powershell-examples\Directory_Syncing\OldDir"
# Directory on System
$target="C:\Users\natst\Documents\Programming\powershell-examples\Directory_Syncing\NewDir"

# USB Directory - Uncomment below two lines and line three if transferring to a USB
#$targetLetter = volume | ? drivetype -eq removable | % driveletter # Auto-Find USB Drive Letter
#$target="${targetLetter}:\"

# Get list of files in source and target directories
$sourceFiles=Get-ChildItem -Path $source
$targetFiles=Get-ChildItem -Path $target # returns null if empty target directory

#Write-Host $sourceFiles
#Write-Host $targetFiles

$syncMode=2

try {
    if ($targetFiles -eq $null) {
        Write-Host "Target Directory Empty - Transferring All Files" -ForegroundColor green
        foreach($file in $sourceFiles) {
            Write-Host "File path: " $file
            Write-Host "Attempting to Copy " $file.Name
	        $sourcePath = -join($source, "\", $file.Name)
            $targetPath = -join($target, "\", $file.Name)
            #Write-Host "Source: " $sourcePath
            #Write-Host "Target: " $targetPath
            Copy-Item -Path $sourcePath -Destination $targetPath
	    Write-Host "Copy Successful" -ForegroundColor green
        }
    }
    else {
        # Identify file content differences for target and source directories; then copy any which aren't in the target dir
        Write-Host "Target Directory Not Empty - Determining Files for Transfer" -ForegroundColor yellow
        $diff=Compare-Object -ReferenceObject $sourceFiles.Name -DifferenceObject $targetFiles.Name
        #Write-Host $diff
        if ($diff -eq $null) {
            Write-Host "No Files Require Transfer - Exiting in 5 seconds" -ForegroundColor green
            Start-Sleep -s 5
            Break
        }
        foreach($f in $diff) {
            if($f.SideIndicator -eq "<=") {
                $fileName = $f.InputObject
                Write-Host "File Name: " $fileName
                $sourcePath = -join($source, "\", $fileName)
                $targetPath = -join($target, $fileName)
                #Write-Host "Source: " $sourcePath
                #Write-Host "Target: " $targetPath
                Write-Host "Attempting to copy: " $fileName
                Copy-Item -Path $sourcePath -Destination $targetPath
		Write-Host "Copy Successful" -ForegroundColor green
            }
        }
    }
    Write-Host "All Files Transferred - Exiting in 5 Seconds" -ForegroundColor green
    Start-Sleep -s 5
}
catch {
    Write-Error -Message "something bad happened!" -ErrorAction Stop
}