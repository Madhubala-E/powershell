if ((Get-WmiObject win32_computersystem).partofdomain -eq $true) {
$MSI = "\\scripts\agent\GCareAgent.msi"
$uname = read-host "Domain username?:" 
} else {
$storageDir = "C:\Program Files (x86)\GCareAgent.msi"
$webclient = New-Object System.Net.WebClient
$url = "http://www.yourwebserver.com/setup.msi"
$file = "$storageDir\setup.msi"
$webclient.DownloadFile($url,$file)
$MSI = C:\users\Public\Downloads\setup.msi
$uname = .\administrator
}
function Install-MSIFile {

[CmdletBinding()]
 Param(
  [parameter(mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
        [ValidateNotNullorEmpty()]
        [string]$msiFile,

        [parameter()]
        [ValidateNotNullorEmpty()]
        [string]$targetDir
 )
if (!(Test-Path $msiFile)){
    throw "Path to the MSI File $($msiFile) is invalid. Please supply a valid MSI file"
}
$arguments = @(
    "/i"
    "`"$msiFile`""
    "/qn"
    "/norestart"
)
if ($targetDir){
    if (!(Test-Path $targetDir)){
        throw "Path to the Installation Directory $($targetDir) is invalid. Please supply a valid installation directory"
    }
    $arguments += "INSTALLDIR=`"$targetDir`""
}
Write-Verbose "Installing $msiFile....."
$process = Start-Process -FilePath msiexec.exe -ArgumentList $arguments -Wait -PassThru -Credential $uname
if ($process.ExitCode -eq 0){
    Write-Verbose "$msiFile has been successfully installed"
}
else {
    Write-Verbose "installer exit code  $($process.ExitCode) for file  $($msifile)"
}
}

$MSI | Install-MSIFile





