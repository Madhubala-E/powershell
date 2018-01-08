<# To verify the server manager status for DHCP and DNS #>
Get-WindowsFeature

<# Install DNS server role #>
Add-WindowsFeature -Name DNS -IncludeManagementTools

Get-WindowsFeature -Name *DNS*

<# Adding DNS server primary zone #>
Add-DnsServerPrimaryZone -Name mazirrusgavs.com -zonefile mazirrusgavs.com.DNS -DynamicUpdate NonsecureAndSecure

<# Install DHCP server role #>
Install-WindowsFeature -Name DHCP -IncludeManagementTools

Get-NetIPConfiguration

<# Adding DHCP server scope #>
Add-DhcpServerv4Scope -Name DHCPClient -StartRange 10.10.2.1 -EndRange 10.10.2.5 -SubnetMask 255.255.255.0

<# To verify the server manager status for Hyper-V #>
Get-WindowsFeature 

Get-WindowsFeature Hyper-V*

<# Install Hyper-V Manager #>
Install-WindowsFeature RSAT-Hyper-V-Tools

<# Adding Hyper-V tools #>
Install-WindowsFeature Hyper-V -IncludeManagementTools

<# Install Hyper-V manager applications #>
Install-WindowsFeature Hyper-V-PowerShell

Get-Command -Module Hyper-V

<# Install the ADDS server role, the AD DS and AD LDS server administration tools #>

Install-WindowsFeature -Name AD-domain-services -IncludeManagementTools

Get-Module -ListAvailable

<# Check the available cmdlets in the ADDSDeployment module #>
Get-command-module ADDSDeployment

<# Adding new AD group #>
New -ADGroup -Name 'Production department' -Description 'Quality support staff' 

Get-ADGroupMember

Import-Module ADDSDeployment

<# Installing a new forest root domain using PowerShell #>
Install-AddsForest