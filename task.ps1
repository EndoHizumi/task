param($db = (Split-Path $MyInvocation.mycommand.path -Parent) + "\taskListDB.accdb")
$erroractionpreference = "stop"
.".\DBConnnect.ps1"

function Add-Task($taskName="", $workDay = "",$endDay="",$priority="(C)") {
    $con = getConnection $db
    $today = if ($workDay.length -eq 0) {get-date -f "yyyy/MM/dd"}
    $now = get-date -f "yyyy/MM/dd HH:mm:ss"
    if ($workDay.length -eq 0){$workDay = $today}
    $projectNames = ($taskName -split " ") -match "(\@\w*)" -join ","
    $tagNames = ($taskName -split " ") -match "(\+\w*)" -join ","
    $query = "insert into TaskList (`
    taskName,startDt,updateAt,createAt,enddt,priority,project,tag)`
     values (`
     '${taskName}','${workDay}','${now}','${now}','${endDay}','${priority}','${projectNames}','${tagNames}'`
     )"
    runQuery $query $con
    disposeConnection $con
}

function get-Tasks($value = "*", [int]$mode = 1) {
    $con = getConnection $db
    if ($mode -gt 2) {$mode = 2}
    $modeList = ("ID", "workName", "workDay")
    $query = if ($value -ne "*") {
        "select * from taskList where $($modeList[${mode}]) = '${value}'"
    }
    else {
        "select * from taskList"        
    }
    format-TaskList (runQuery $query $con)
    disposeConnection $con
}

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

function Show-Tasks($value = "*", [int]$mode = 1) {
    $result = get-Tasks $value $mode 
    $result | Format-Table
}

function remove-task($workName, $workDay, [int]$mode = 0) {
    # $mode = 0:作業名を指定して削除,1:作業日を指定して削除,2:作業日と作業名を指定して削除
    $con = getConnection $db
    $modeList = ("workName like '${workName}'", "workDay = '${workDay}'", "workName like '${workName}' and workDay = '${workDay}'")
    $query = "delete from taskList where $($modeList[${mode}])"
    runQuery $query $con
    #AutoNumber型を振りなおす
    $count = [int] (runQuery "select count(*) from tasklist" $con)[0] + 1
    $query = "ALTER TABLE tasklist ALTER COLUMN id COUNTER(${count},1)"
    runQuery $query $con
    disposeConnection $con
}

function update-task($workName = "", $new = "", [int]$mode = 1) {
    $con = getConnection $db
    $now = get-date -f "yyyy/MM/dd HH:mm:ss"
    if ($mode -gt 1) {$mode = 1}
    $modeList = ("workName", "workDay")
    $query = "update TaskList set $($modeList[${mode}])='${new}',updateAt='${now}' where $($modeList[0])='${workName}'"
    runQuery $query $con
    disposeConnection $con
}