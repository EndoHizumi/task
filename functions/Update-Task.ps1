function update-task($workName = "", $new = "", [int]$mode = 1) {
    $con = getConnection $db
    $now = get-date -f "yyyy/MM/dd HH:mm:ss"
    if ($mode -gt 1) {$mode = 1}
    $modeList = ("workName", "workDay")
    $query = "update TaskList set $($modeList[${mode}])='${new}',updateAt='${now}' where $($modeList[0])='${workName}'"
    runQuery $query $con
    disposeConnection $con
}