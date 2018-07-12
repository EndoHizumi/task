param($method)
$ScriptPath =(Split-Path $MyInvocation.mycommand.path -Parent)
$erroractionpreference = "stop"
."${ScriptPath}\DBController.ps1"
$db = (join-Path $PSScriptRoot "taskListDB.db")
".\functions\*.ps1" | 
Resolve-Path | 
Where-Object{!$_.Path.ToLower().contains(".tests.") } |
ForEach-Object{
    . $_.path
}
