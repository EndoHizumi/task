.".\taskRegistor.ps1"
$today = date -Format "yyyy/MM/dd"

function test-getTask(){
    "�S��"
    $result = get-Tasks
    assert-Return $result.count 1 $result

    "�^�X�N���Œ��o"
    $result = get-Tasks "�e�X�g�^�X�N" 1
    assert-Return $result.count 1 $result
    
   
    "���t�Œ��o"
    $result = get-Tasks $today 2
    assert-Return $result.count 1 $result

    "2�ȏ���w�肵���Ƃ�"
    $result = get-Tasks $today 3
    assert-Return $result.count 1 $result

}

function test-ShowTask(){
     "�S��"
    $result = Show-Tasks
    assert-Return $result.count 5 $result

    "�^�X�N���Œ��o"
    $result = Show-Tasks "�e�X�g�^�X�N" 1
    assert-Return $result.count 5 $result
   
    "���t�Œ��o"
    $result = Show-Tasks $today 2
    assert-Return $result.count 5 $result

    "2�ȏ���w�肵���Ƃ�"
    $result = Show-Tasks $today 3
    assert-Return $result.count 5 $result
}

function test-AddTask(){
    Add-Task "�e�X�g�^�X�N"
    $result = get-Tasks "�e�X�g�^�X�N" 1
    assert-Return $result.count 1
}

function test-UpdateTask(){
    "��Ɩ��̕ύX"
    Update-Task "�e�X�g�^�X�N" "�e�X�g�^�X�N2" 0
    $result = get-Tasks "�e�X�g�^�X�N2" 1
    assert-Return $result.count 1
    "��Ɠ��̕ύX"
    Update-Task "�e�X�g�^�X�N2" "2018/05/01" 1
    $result = get-Tasks "2018/05/01" 2
    assert-Return $result.count 1
}

function test-RemoveTask(){
    Add-Task "�e�X�g�^�X�N2"
    "��Ɩ����w�肵�č폜"
    Remove-Task "�e�X�g�^�X�N2" "" 0
    $result = get-Tasks "�e�X�g�^�X�N2" 1
    assert-Return $result.count 0
    Add-Task "�e�X�g�^�X�N2" 
    "��Ɠ����w�肵�č폜"
    Remove-Task "" $today 1
    $result = get-Tasks $today 2
    assert-Return $result.count 0
    Add-Task "�e�X�g�^�X�N2"
    "��Ɠ��ƍ�Ɩ����w�肵�č폜"
    Remove-Task "�e�X�g�^�X�N2" $today  2
    $result = get-Tasks "�e�X�g�^�X�N2" 1
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
add-task "�e�X�g�^�X�N"
"execute test-GetTask"
test-getTask
"execute test-ShowTask"
test-ShowTask
remove-task "�e�X�g�^�X�N"
disposeConnection $con