# define these as needed
$defaultVmName = 'Ubuntu'
$vmName = Read-Host "VM name [$defaultVmName]"
$vmName = ($defaultVmName, $vmName)[[bool]$vmName]

$isoPath = Read-Host 'Installation ISO path'
$sharedFolderPath = Read-Host 'Shared folder path'

$virtualBoxHome = 'C:\Program Files\Oracle\VirtualBox'
if (!(Test-Path $virtualBoxHome)) {
    $virtualBoxHome = Read-Host -Prompt 'Virtual Box installation directory'
}
$env:Path = "$virtualBoxHome;$env:Path"

function vbox ([string] $command){
    VBoxManage $command $vmName $args
} 

# create VM and configure general settings
Write-Host '=> Creating VM'
VBoxManage createvm --name $vmName --ostype Ubuntu_64 --register
vbox modifyvm `
    --memory 2048 `
    --vram 128 `
    --cpus 2 `
    --clipboard bidirectional `
    --draganddrop hosttoguest

$machineFile = (vbox showvminfo | Select-String -Pattern '^Config file:[\s\t]*(.*)$').Matches.Groups[1].Value
$machineFolder = Split-Path $machineFile

# primary disk
Write-Host '=> Creating HDD'
$vhdFile = Join-Path $machineFolder "$vmName.vdi"
VBoxManage createmedium disk --filename $vhdFile --size 20480
vbox storagectl --name SATA --add sata
vbox storageattach --storagectl SATA --port 0 --type hdd --medium $vhdFile

# optical drive with installation ISO
Write-Host '=> Creating DVD drive and attaching ISO'
vbox storagectl --name IDE --add ide
vbox storageattach --storagectl IDE --port 0 --device 0 --type dvddrive --medium $isoPath

# shared folder
Write-Host "=> Creating shared folder 'work' => $sharedFolderPath"
VBoxManage sharedfolder add $vmName --name work --hostpath $sharedFolderPath --automount

# boot
vbox startvm