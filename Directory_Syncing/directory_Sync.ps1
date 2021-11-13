$source="C:\Users\natst\Documents\Programming\Powershell_Practice\Directory_Syncing\OldDir" 
# Directory on System
$target="C:\Users\natst\Documents\Programming\Powershell_Practice\Directory_Syncing\NewDir" 

# USB Directory
#$targetLetter = volume | ? drivetype -eq removable | % driveletter # Auto-Find USB Drive Letter
#$target="${targetLetter}:\"

# Get list of files in source and target directories
$sourceFiles=Get-ChildItem -Path $source -Recurse
$targetFiles=Get-ChildItem -Path $target -Recurse

$syncMode=2
<#
Write-Host $sourceFiles
Write-Host $targetFiles

foreach($f in $sourceFiles) {
    Write-Host $f
}
foreach($f in $targetFiles) {
    Write-Host $f
}
#>


try {
    # Identify file content differences for target and source directories; then copy any which aren't in the target dir
    $diff=Compare-Object -ReferenceObject $sourceFiles -DifferenceObject $targetFiles
    Write-Host $diff
    foreach($f in $diff) {
        if($f.SideIndicator -eq "<=") {
            $filename = $f.InputObject.Basename
            $fullSourceObject=$f.InputObject.FullName
            $fullTargetObject=$f.InputObject.FullName.Replace($source, $target)
    
            Write-Host "Attemp to copy the following: " $filename
            Copy-Item -Path $fullSourceObject -Destination $fullTargetObject
        }
    }
}
catch {
    Write-Error -Message "something bad happened!" -ErrorAction Stop
}