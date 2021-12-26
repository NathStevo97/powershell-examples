# Get all printers associated with the system
Get-Printer

# Remove Printer from System
Remove-Printer -Name "Microsoft XPS Document Writer"

# Add printer to system based on: name, drivername and portname
Add-Printer -Name "Microsoft Print to PDF " -DriverName "Microsoft Print To PDF " -PortName " PORTPROMPT:"