.".\task.ps1"
$today = date -Format "yyyy/MM/dd"

# simple add task
function test-AddtaskOne () {
    add-task "test task"
    $tasklist = get-tasks
    if($taskList.count -ne 1 -or $taskList.taskName -ne "test task" ){
        throw "test failure. taskList count:$($taskList.count)`r`n $($taskList.name)" 
    }
}

# specified startDate
# specified endDate
# append projectName
# append tagName
# specified state
# specified priority



"execute test-Addtask"
test-AddtaskOne