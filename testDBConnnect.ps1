."./DBConnnect.ps1"

function testStatementFactory () {
    # generate queryObject(paramType:Array)
    $queryObj = statementFactory -type "test" -param ("hoge","fuga") 
    checkObj -obj $queryObj -type "test" -param ("hoge","fuga")
}
function testBuildQuery () {
    $selectObj = getSelectObj("col1","col2") 
    $fromObj = getFromObj("table1")
    $query = buildQuery ($selectObj,$fromObj)
    if($query -ne "select col1,col2 from table1;"){
        Write-Error "failed. ${query} is No Match String"
    }
}
function testSelect () {
    # generate Select queryObject(paramType:Array)
    $selectObj = getSelectObj ("hoge","fuga") 
    checkObj -obj $selectObj -type "select" -param ("hoge","fuga")
}

function checkObj($obj,[String]$type,[Array]$param){
    # check Type 
    [String] $actual = $obj.type
    [String] $expcet = $type
    if ($expcet.Equals($actual) -eq $false){
        Write-Error "failed. ${expcet} is ${$actual}"
        $result = $false
    } 
    
    #check param
    [array]$actual = $obj.param
    [array]$expcet = $param
    [int] $count = 0
    foreach ($item In $actual){
        if ($item.Equals($expcet[$count]) -eq $false){
            Write-Error "failed. ${item} is "$($expcet[$count])
            $result = $false
        } 
        $count +=1  
    }
    $result         
}

function testRunQuery () {
    $con = getConnection ".\taskListDB.accdb"
    $query = "select * from taskList"
    $result = runQuery $query $con
    foreach($item in $result){
        for($i=0;$i -lt $item.FieldCount; $i++){
            $item.item($i)
        }
    }
}


# Write-Host "execute:testStatementFactory"
# testStatementFactory
# Write-Host "execute:testSelect"
# testSelect
# Write-Host "execute:testBuildQuery"
# testBuildQuery
Write-host "execute:testRunQuery"
testRunQuery