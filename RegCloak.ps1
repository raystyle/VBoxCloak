#################################################
## RegCloak: A script that renames/modifies certain VirtualBox-related registry values/keys that are commonly enumerated by malware for anti-analysis purposes.
## Written and tested on Windows 7 System, but will likely work for Windows 10 as well.
## Many thanks to pafish for some the ideas :) https://github.com/a0rtega/pafish
##################################################
## Author: d4rksystem
## Version: 1.0
##################################################
## Tips:
## - You will need to run this as Admin!
## - This script is designed to be run in a VM in an ad-hoc manner, and then the VM will ideally be reset. This script will likely break your VM long-term, so ensure you have a snapshot!
## - You may need to run this script again in the VM as needed, as Windows is pretty good at resetting some of these values after a certain amount of time.
##################################################

# Modify system BIOS version
if (Get-ItemProperty -Path "HKLM:\HARDWARE\Description\System" -Name "SystemBiosVersion" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Modifying Reg Key HKLM:\HARDWARE\Description\System\SystemBiosVersion..."
	Set-ItemProperty -Path "HKLM:\HARDWARE\Description\System" -Name "SystemBiosVersion" -Value "LOLBIOSv2"

} Else {

    Write-Output '[!] Reg Key HKLM:\HARDWARE\Description\System\SystemBiosVersion does not seem to exist! Skipping this one...'
}

# Modify CurrentControlSet BIOS info
if (Get-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SystemInformation" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Modifying Reg Key Values in HKLM:\SYSTEM\CurrentControlSet\Control\SystemInformation..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SystemInformation" -Name "BIOSVersion" -Value "LOLBIOSv1"
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SystemInformation" -Name "BIOSReleaseDate" -Value "12/01/2015"
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SystemInformation" -Name "BIOSProductName" -Value "LOLBIOS"

} Else {

    Write-Output '[!] Reg Key HKLM:\SYSTEM\CurrentControlSet\Control\SystemInformation does not seem to exist! Skipping this one...'
}

# Modify system BIOS date
if (Get-ItemProperty -Path "HKLM:\HARDWARE\Description\System" -Name "SystemBiosDate" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Modifying Reg Key HKLM:\HARDWARE\Description\System\SystemBiosDate"
	Set-ItemProperty -Path "HKLM:\HARDWARE\Description\System" -Name "SystemBiosDate" -Value "01/02/15"

} Else {

    Write-Output '[!] Reg Key HKLM:\HARDWARE\Description\System\SystemBiosDate does not seem to exist! Skipping this one...'
}

# Modify system BIOS Video Version
if (Get-ItemProperty -Path "HKLM:\HARDWARE\Description\System" -Name "VideoBiosVersion" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Modifying Reg Key HKLM:\HARDWARE\Description\System\VideoBiosVersion"
	Set-ItemProperty -Path "HKLM:\HARDWARE\Description\System" -Name "VideoBiosVersion" -Value "VGALOLBIOSv2"

} Else {

    Write-Output '[!] Reg Key HKLM:\HARDWARE\Description\System\VideoBiosVersion does not seem to exist! Skipping this one...'
}

# Rename Guest Additions Reg Key
if (Get-Item -Path "HKLM:\SOFTWARE\Oracle\VirtualBox Guest Additions" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\SOFTWARE\Oracle\VirtualBox Guest Additions"
	Rename-Item -Path "HKLM:\SOFTWARE\Oracle\VirtualBox Guest Additions" -NewName "HidingFromTheMalwarez"

} Else {

    Write-Output '[!] Reg Key HKLM:\SOFTWARE\Oracle\VirtualBox Guest Additions does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename ACPI DSDT Reg Key
if (Get-Item -Path "HKLM:\HARDWARE\ACPI\DSDT\VBOX__" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\HARDWARE\ACPI\DSDT\VBOX__"
	Rename-Item -Path "HKLM:\HARDWARE\ACPI\DSDT\VBOX__" -NewName "ACPISTUFF"

} Else {

    Write-Output '[!] Reg Key HKLM:\HARDWARE\ACPI\DSDT\VBOX__ does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename ACPI FADT Reg Key
if (Get-Item -Path "HKLM:\HARDWARE\ACPI\FADT\VBOX__" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\HARDWARE\ACPI\FADT\VBOX__"
	Rename-Item -Path "HKLM:\HARDWARE\ACPI\FADT\VBOX__" -NewName "ACPISTUFF"

} Else {

    Write-Output '[!] Reg Key HKLM:\HARDWARE\ACPI\FADT\VBOX__ does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename ACPI RSDT Reg Key
if (Get-Item -Path "HKLM:\HARDWARE\ACPI\RSDT\VBOX__" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\HARDWARE\ACPI\RSDT\VBOX__"
	Rename-Item -Path "HKLM:\HARDWARE\ACPI\RSDT\VBOX__" -NewName "ACPISTUFF"

} Else {

    Write-Output '[!] Reg Key HKLM:\HARDWARE\ACPI\RSDT\VBOX__ does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename VBoxMouse Reg Key
if (Get-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxMouse" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxMouse"
	Rename-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxMouse" -NewName "LOLMouse"

} Else {

    Write-Output '[!] Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxMouse does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename VBoxService Reg Key
if (Get-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxService" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxService"
	Rename-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxService" -NewName "LOLService"

} Else {

    Write-Output '[!] Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxService does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename VBoxSF Reg Key
if (Get-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxSF" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxSF"
	Write-Output "[!] Warning: This will disconnect VM shared folders. You will need to reconnect them later..."
	Rename-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxSF" -NewName "LOLSF"

} Else {

    Write-Output '[!] Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxSF does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename VBoxVideo Reg Key
if (Get-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxVideo" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxVideo"
	Rename-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxVideo" -NewName "LOLVideo"

} Else {

    Write-Output '[!] Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxVideo does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename VBoxGuest Reg Key
if (Get-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxGuest" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxGuest"
	Rename-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxGuest" -NewName "LOLGuest"

} Else {

    Write-Output '[!] Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxGuest does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename VBoxGuest Reg Key
if (Get-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxGuest" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxGuest"
	Rename-Item -Path "HKLM:\SYSTEM\ControlSet001\services\VBoxGuest" -NewName "LOLGuest"

} Else {

    Write-Output '[!] Reg Key HKLM:\SYSTEM\ControlSet001\services\VBoxGuest does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename VBoxTray Reg Key
if (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "VBoxTray" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\VBoxTray"
	Rename-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "VBoxTray" -NewName "LOLTray"

} Else {

    Write-Output '[!] Reg Key HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\VBoxTray does not seem to exist, or has already been renamed! Skipping this one...'
}

# Rename VBox Uninstaller Reg Key
if (Get-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Oracle VM VirtualBox Guest Additions" -ErrorAction SilentlyContinue) {

    Write-Output "[*] Renaming Reg Key HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Oracle VM VirtualBox Guest Additions"
	Rename-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Oracle VM VirtualBox Guest Additions" -NewName "LOL LOL LOL"

} Else {

    Write-Output '[!] Reg Key HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Oracle VM VirtualBox Guest Additions does not seem to exist, or has already been renamed! Skipping this one...'
}

Write-Output "** Done! Did you recieve a lot of errors? Try running as Admin!"