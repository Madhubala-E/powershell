$msifile= 'C:\Program Files (x86)\GCareAgent.msi' 
$arguments= ' /qn /l*v .\install_SQLSysClrTypes.txt' 
Start-Process `
     -file  $msifile `
     -arg $arguments `
     -passthru | wait-process