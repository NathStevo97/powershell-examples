# Create XML File
New-Item G:\padmini\SourceFolder\NewFile.xml -ItemType File

# Add Content to XML File
Set-Content G:\padmini\SourceFolder\NewFile.xml '<title>Welcome to Top 51 PowerShell Example</title>'

# Get Content from XML File
Get-Content G:\padmini\SourceFolder\NewFile.xml