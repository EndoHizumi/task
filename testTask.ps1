.".\task.ps1"
$today = date -Format "yyyy/MM/dd"
function test-Addtask () {
    add-task "test task"
    $tasklist = get-tasks
    if($taskList.count -ne 1 -or $taskList.taskName -ne "test task" ){
        throw "test failure. taskList count:$($taskList.count)`r`n $($taskList.name)" 
    }
}

"execute test-Addtask"
test-Addtask