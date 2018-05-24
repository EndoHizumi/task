param($method)
$ScriptPath =(Split-Path $MyInvocation.mycommand.path -Parent)
$erroractionpreference = "stop"
."${ScriptPath}\DBConnnect.ps1"
$db = ((Resolve-Path ".\taskListDB.accdb").path)
$con = getConnection $db
".\functions\*.ps1" | 
Resolve-Path | 
Where-Object{!$_.Path.ToLower().contains(".tests.") } |
ForEach-Object{
    . $_.path
}

$isValid = ((Get-ChildItem function:).name).ToLower().Contains($method.ToLower())
if ($isValid -eq $true){
    & $method $args[0] $args[1] $args[2] $args[3] $args[4] $args[5] $args[6] $args[7] $args[8] $args[9]
}else{
    "$($args[0]) is invaild Command."
}
disposeConnection $con
