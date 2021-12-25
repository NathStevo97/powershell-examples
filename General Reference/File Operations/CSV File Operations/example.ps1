# Create File
New-Item G:\padmini\SourceFolder\NewCSVFile.csv -ItemType File

# Add Content to CSV File
Set-Content G:\padmini\SourceFolder\NewCSVFile.csv 'Monday,Sunday,Tuesday'

# Get Content
Get-Content G:\padmini\SourceFolder\NewCSVFile.csv