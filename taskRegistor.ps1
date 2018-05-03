param($db = (Split-Path $MyInvocation.mycommand.path -Parent)+"\taskListDB.accdb")
$erroractionpreference="stop"
.".\DBConnnect.ps1"
$con = getConnection $db

function Add-Task($workName,$workDay=""){
    $today = if ($workDay.length -eq 0) {get-date -f "yyyy/MM/dd"}
    $now = get-date -f "yyyy/MM/dd HH:mm:ss"
    $query = "insert into TaskList (workName,workDay,updateAt,createAt) values ('${workName}','${today}','${now}','${now}')"
    runQuery $query $con
}

function get-Tasks($value="*",[int]$mode=1){
    if ($mode -gt 2){$mode=2}
    $modeList=("ID","workName","workDay")
    $query = if ($value -ne "*") {
        "select * from taskList where $($modeList[${mode}]) = '${value}'"
    }else{
        "select * from taskList"        
    }
   runQuery $query $con
}

function Show-Tasks($value="*",[int]$mode=1){
    $value = get-tasks $value $mode
    $line=New-Object System.Collections.ArrayList
    foreach($item in $value){
        $columnObject =  New-Object PSObject
        for($i=0;$i -lt $item.FieldCount;$i++){
            Add-Member -InputObject $columnObject -Name col$i -Value $item.item($i) -MemberType NoteProperty
        }
        [void] $line.add($columnObject)
    }
    Write-Output $line | Format-Table
}

function remove-task($workName,$workDay,[int]$mode){
    # $mode = 0:作業名を指定して削除,1:作業日を指定して削除,2:作業日と作業名を指定して削除
    $modeList=("workName = '${workName}'","workDay = '${workDay}'","workName = '${workName}' and workDay = '${workDay}'")
    $query = "delete from taskList where $($modeList[${mode}])"
    $query
    runQuery $query $con
}

function update-task($workName="",$new="",[int]$mode = 1){
    $today = get-date -f "yyyy/MM/dd"
    $now = get-date -f "yyyy/MM/dd HH:mm:ss"
    if ($mode -gt 1){$mode=1}
    $modeList=("workName","workDay")
    $query = "update TaskList set $($modeList[${mode}])='${new}',updateAt='${now}' where $($modeList[0])='${workName}'"
    runQuery $query $con
}