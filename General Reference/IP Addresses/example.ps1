# Get current system IP address for remoting
Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName . | Format-Table -Property IPAddress

# Get all IP Addresses associated with system
Get-NetIPAddress

