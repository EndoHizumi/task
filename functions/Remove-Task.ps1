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
