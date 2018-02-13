
$New_msi_path= "C:\Program Files\GCareAgent\GCareAgent.msi"
    
    $msifile= $New_msi_path
    $arguments= ' /qn /l*v .\install_SQLSysClrTypes.txt' 
Start-Process `
     -file  $msifile `
     -arg $arguments `
     -passthru | wait-process

