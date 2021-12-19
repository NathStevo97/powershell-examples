# Folder Creation
New-Item -Path 'G:\padmini\NewPowerShellFolder' -ItemType Directory

# Copy Folder
Copy-Item 'G:\padmini\SourceFolder' 'C:\DestinationFolder'

# Delete Folder
Remove-Item 'C:\DestinationFolder\SourceFolder'

# Move Folder
Move-Item C:\SourceFolder G:\padmini

# Rename Folder
Rename-Item 'G:\padmini\padmini images'

# Check if folder exists:
Test-Path 'G:\padmini\SiteCollectionFolder'