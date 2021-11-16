$source="C:\Users\natst\Documents\Programming\Powershell_Practice\Directory_Syncing\OldDir" 
# Directory on System
$target="C:\Users\natst\Documents\Programming\Powershell_Practice\Directory_Syncing\NewDir" 

# USB Directory - Uncomment below two lines and line three if transferring to a USB
#$targetLetter = volume | ? drivetype -eq removable | % driveletter # Auto-Find USB Drive Letter
#$target="${targetLetter}:\"

# Get list of files in source and target directories
$sourceFiles=Get-ChildItem -Path $source 
$targetFiles=Get-ChildItem -Path $target # returns null if empty target directory

$syncMode=2

try {
    if ($targetFiles -eq $null) {
        Write-Host "Target Directory Empty - Transferring All FIles"
        foreach($file in $sourceFiles) {
            Write-Host "Attempting to Copy " $file.BaseName
            Copy-Item -Path $file -Destination $target
        }
    }
    else {
        # Identify file content differences for target and source directories; then copy any which aren't in the target dir
        $diff=Compare-Object -ReferenceObject $sourceFiles.Name -DifferenceObject $targetFiles.Name
        foreach($f in $diff) {
            if($f.SideIndicator -eq "<=") {
                $fileName = $f.InputObject
                $sourcePath = -join($source, "\", $fileName)
                $targetPath = -join($target, "\", $fileName)
                Write-Host "Attempt to copy the following: " $fileName
                Copy-Item -Path $sourcePath -Destination $targetPath
        }
    }
    }
}
catch {
    Write-Error -Message "something bad happened!" -ErrorAction Stop
}