# PnP = Plug and Play devices
# List all
Get-PnpDevice
# List by particular FriendlyName
Get-PnpDevice -FriendlyName 'Generic USB Hub'
# Get motherboard resources
Get-PnpDevice -FriendlyName "Motherboard resources"