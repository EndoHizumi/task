function format-TaskList ([Array] $taskData) {
    $taskList = New-Object System.Collections.ArrayList
    foreach ($item in $taskData) {
        $columnObject = New-Object PSObject
        for ($i = 0; $i -lt $item.FieldCount; $i++) {
            Add-Member -InputObject $columnObject -Name $item.getName($i) -Value $item.item($i) -MemberType NoteProperty
        }
        [void] $taskList.add($columnObject)
    }
    , $taskList
}
function get-Task($value = "*", [int]$mode = 1) {
    if ($mode -gt 2) {$mode = 2}
    $modeList = ("ID", "workName", "workDay")
    $query = if ($value -ne "*") {
        "select * from taskList where $($modeList[${mode}]) = '${value}'"
    }
    else {
        "select * from taskList"        
    }
    format-TaskList (runQuery $query $con)
}

function Show-Task($value = "*", [int]$mode = 1) {
    $result = get-Task $value $mode 
    $result | Format-Table
}
