# Create a New File
New-Item -Path 'G:\padmini\NewPowerShellFolder\ImportantNoteRelatedToPowerShell.txt'-ItemType File

# Copy File To New FOlder
Copy-Item 'G:\padmini\SourceFolder\NewText.txt' 'C:\DestinationFolder\NewText.txt'

# Delete File from Folder
Remove-Item 'C:\NewFolderForPowerShell\ImportantNoteRelatedToPowerShell.txt'

# Recursively Delete File from Folder
Remove-Item 'G:\padmini\NewPowerShellFolder\ImportantNoteRelatedToPowerShell.txt'-Recurse

# Move File to Folder
Move-Item 'G:\padmini\SourceFolder\PSNote.txt' C:\DestinationFolder

# Rename File (New Name Required as Input)
Rename-Item 'C:\NewFolderForPowerShell\PowerShell.txt'

# Check if File Exists
Test-Path 'C:\NewFolderForPowerShell\New File.txt'

# Retrieve Content from a File
Get-Content 'E:\TargetFolder\TargetFile.txt'