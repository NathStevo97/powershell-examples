# Display Current Date in Day, Date, Time
Get-Date

# Display current date, date only (Swap Date with Time if desired)
Get-Date -DisplayHint Date

# Display Date and Time in Shorthand (g usis .NET Framework)
Get-Date -Format g

# Get Date in yy/mm/dd format with day of the week and offset from UTC
Get-Date -UFormat "%Y / %m / %d / %A / %Z"

# Get Day of the Year (Numerical)
(Get-Date - the Year 2018 -Month 9 -Day 25).DayOfYear

# Convert Date and Time to UTC Time
$a = Get-Date
$a.ToUniversalTime()

# Set System Date and Time
set-date -date "06/08/2019 18:53"

# Add Dates with Powershell
Set-Date -Date (Get-Date).AddDays(5)

# Adjust System Clock by X Amount
Set-Date -Adjust -0:15:0 -DisplayHint Time

# Add Minutes to System Clock
$a = New-TimeSpan -Minutes 150
Set-Date -Adjust $a