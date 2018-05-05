.".\taskRegistor.ps1"
$today = date -Format "yyyy/MM/dd"

function test-getTask(){
    "全て"
    $result = get-Tasks
    assert-Return $result.count 1 $result

    "タスク名で抽出"
    $result = get-Tasks "テストタスク" 1
    assert-Return $result.count 1 $result
    
   
    "日付で抽出"
    $result = get-Tasks $today 2
    assert-Return $result.count 1 $result

    "2以上を指定したとき"
    $result = get-Tasks $today 3
    assert-Return $result.count 1 $result

}

function test-ShowTask(){
     "全て"
    $result = Show-Tasks
    assert-Return $result.count 5 $result

    "タスク名で抽出"
    $result = Show-Tasks "テストタスク" 1
    assert-Return $result.count 5 $result
   
    "日付で抽出"
    $result = Show-Tasks $today 2
    assert-Return $result.count 5 $result

    "2以上を指定したとき"
    $result = Show-Tasks $today 3
    assert-Return $result.count 5 $result
}

function test-AddTask(){
    Add-Task "テストタスク"
    $result = get-Tasks "テストタスク" 1
    assert-Return $result.count 1
}

function test-UpdateTask(){
    "作業名の変更"
    Update-Task "テストタスク" "テストタスク2" 0
    $result = get-Tasks "テストタスク2" 1
    assert-Return $result.count 1
    "作業日の変更"
    Update-Task "テストタスク2" "2018/05/01" 1
    $result = get-Tasks "2018/05/01" 2
    assert-Return $result.count 1
}

function test-RemoveTask(){
    Add-Task "テストタスク2"
    "作業名を指定して削除"
    Remove-Task "テストタスク2" "" 0
    $result = get-Tasks "テストタスク2" 1
    assert-Return $result.count 0
    Add-Task "テストタスク2" 
    "作業日を指定して削除"
    Remove-Task "" $today 1
    $result = get-Tasks $today 2
    assert-Return $result.count 0
    Add-Task "テストタスク2"
    "作業日と作業名を指定して削除"
    Remove-Task "テストタスク2" $today  2
    $result = get-Tasks "テストタスク2" 1
    assert-Return $result.count 0
}

function assert-Return($actual,$expect,$result){
    if ($expect -ne $actual){
        out-log $result
        throw "test failure. expect:${expect} actual:${actual}"
    }
}

function out-Log($value){
    $timestamp = date -f "yyyyMMddhhmmss"
    $value |  out-file "log\testTaskreg${timestamp}.txt"
}

"execute test-AddTask"
test-AddTask
"execute test-UpdateTask"
test-UpdateTask
"execute test-RemoveTask"
test-RemoveTask
add-task "テストタスク"
"execute test-GetTask"
test-getTask
"execute test-ShowTask"
test-ShowTask
remove-task "テストタスク"
disposeConnection $con