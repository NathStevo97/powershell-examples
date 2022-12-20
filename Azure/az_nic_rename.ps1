<#
.SYNOPSIS
Rename Azure VM Network Interfaces.

.DESCRIPTION
Rename single or multiple Network Adapter interfaces attached to an Azure Virtual Machine (Linux and Windows).

.EXAMPLE
.\Rename-AzVMNIC.ps1 -resourceGroup [ResourceGroupName] -VMName [VMName] -NewNicName [NewNicName] -Subscription [AzSub] -Verbose
This example will rename the NIC interface for the specified VM, you need to specify the Resource Group name, VM name, and the new NIC name.
The script will preserve the old network settings and apply them to the new network interface.
#>

[CmdletBinding()]
Param (
[Parameter(Position = 0, Mandatory = $true, HelpMessage = 'Enter the Resource Group of the VM')]
[Alias('rg')]
[String]$resourceGroup,

[Parameter(Position = 1, Mandatory = $True, HelpMessage = 'Enter Azure VM name')]
[Alias('VM')]
[String]$VMName,

[Parameter(Position = 2, Mandatory = $True, HelpMessage = 'Enter New NIC name')]
[Alias('NIC')]
[String]$NewNicName

[Parameter(Position = 3, Mandatory = $True, HelpMessage = 'Enter Azure Subscription ID')]
[Alias('SUB')]
[String]$AzSub
)

#! Check Azure Connection
Try {
Write-Verbose "Connecting to Azure Cloud..."
Connect-AzAccount -ErrorAction Stop | Out-Null
}
Catch {
Write-Warning "Cannot connect to Azure Cloud. Please check your credentials. Exiting!"
Break
}

Set-AzContext -SubscriptionId $AzSub

#! Get the details of the VM
Write-Verbose "Get the VM information details: $VMName"
$VM = Get-AzVM -Name $VMName -ResourceGroupName $resourceGroup

#! Get all the virtual NIC interfaces, names and details
Write-Verbose "Get all the virtual NIC interface names and details..."
$oldNics = $VM.NetworkProfile.NetworkInterfaces
for ($i = 0; $i -lt $oldNics.Count; $i++) {
$PIpName = $null
$oldNicName = $oldNics[$i].Id.Split('/')[-1]
$vNic = Get-AzNetworkInterface -Name $oldNicName -ResourceGroupName $resourceGroup
}
#$NewNicName = Read-Host "`nEnter the NIC interface name - Network interface card name must be unique"

#! Stop the Azure VM
if ( (Get-AzVM -Name $VMName -status).PowerState -eq "VM running" ) {
Write-Verbose "Stop and deallocate the VM: $VMName, please wait..."
Stop-AzVM -Name $VMName -ResourceGroupName $resourceGroup -Force -Confirm:$false | Out-Null
}

#! Create the new virtual NIC interface
Write-Verbose "Creating the new virtual Network interface..."
$NIC = New-AzNetworkInterface -Name $NewNicName -ResourceGroupName $resourceGroup `
-Location $VM.Location -SubnetId $vNic.IpConfigurations.Subnet.Id `
-IpConfigurationName $vNic.IpConfigurations.Name

#! Remove the old NIC interface from the VM
Write-Warning "Removing the old NIC interface: $($oldNicName) from the VM: $VMName"
Remove-AzVMNetworkInterface -vm $VM -NetworkInterfaceIDs $vNic.Id | Out-Null

#! Add the new NIC interface
Write-Verbose "Adding the new network adapter interface to the VM..."
Add-AzVMNetworkInterface -VM $VM -Id $NIC.Id -Primary | Update-AzVM -ResourceGroupName $resourceGroup | Out-Null

#! Delete the old NIC interface resource
Write-Warning "Deleting the old NIC interface: $($oldNicName)"
Remove-AzNetworkInterface -Name $oldNicName -ResourceGroupName $vNic.ResourceGroupName -Force -Confirm:$false

#! Update the new virtual NIC settings
$NIC = Get-AzNetworkInterface -Name $NewNicName -ResourceGroupName $resourceGroup
If ($vNic.Tag -ne $null) {
$NIC.Tag = $vNic.Tag
}
$NIC.DnsSettings = $vNic.DnsSettings
$NIC.EnableIPForwarding = $vNic.EnableIPForwarding
$NIC.EnableAcceleratedNetworking = $vNic.EnableAcceleratedNetworking
$NIC.NetworkSecurityGroup = $vNic.NetworkSecurityGroup

#! Set the new virtual NIC settings
Write-Verbose "Set the new NIC interface settings..."
If ($NIC.IpConfigurations.PrivateIpAddress -ne $vNic.IpConfigurations.PrivateIpAddress) {
Set-AzNetworkInterfaceIpConfig -NetworkInterface $NIC -Name $NIC.IpConfigurations.Name `
-PrivateIpAddressVersion $vNic.IpConfigurations.PrivateIpAddressVersion `
-PrivateIpAddress $vNic.IpConfigurations.PrivateIpAddress -SubnetId $vNic.IpConfigurations.Subnet.id | Out-Null
}
Set-AzNetworkInterface -NetworkInterface $NIC | Out-Null

#! Start the VMName
Write-Verbose "Start the VM: $VMName, please wait..."
Start-AzVM -Name $VMName -ResourceGroupName $resourceGroup -Confirm:$false | Out-Null
 