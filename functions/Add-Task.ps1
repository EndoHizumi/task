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
