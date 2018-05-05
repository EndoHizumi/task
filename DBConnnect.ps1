function getConnection($db){
    New-Object System.Data.Odbc.OdbcConnection("Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=$db;")
}

# return select PSObject
function getSelectObj($col){
    write-debug "select function"
    StatementFactory -type "select" -param $col
}

function getfromObj ($table) {
    write-debug "from function"
    StatementFactory -type "from" -param $table
}

function getInsertObj(){

}
function getUpdateObj(){

}
function getWhereObj(){

}

function  getDeleteObj() {
    
}

# クエリオブジェクト配列を走査し、SQLクエリ文を生成する。
# 例：（後でドキュメントに分離）
# IN:selectクエリオブジェクト{
# type:select
# parama:hoge,fuga}
# out: select hoge fuga
# [ select | update | delete | insert into table( ] col [ ) values(value)] [from] table [where] option
function buildQuery([Array] $queryObject){
    $statementType=""
    $statementList = @{}
    foreach ($obj in $queryObject){
        
    }
}
function runQuery($query,$connection){
    try{
        $query = New-Object System.Data.Odbc.OdbcCommand($query, $connection)
        if ($connection.state -eq "Closed") {$connection.Open()}
        $query.ExecuteReader()
    }catch{
        throw
    }finally{
        if ($reader -ne $null){
            $reader.Close()
        }
     $connection.close()   
    }
}

function StatementFactory([String]$class,[String]$type,[Array]$param){
    write-debug "StatementFactory function"
    [string[]]$keys = $PSBoundParameters.Keys
    $queryObject = New-Object PSObject -Property $PSBoundParameters
    return $queryObject
}

function disposeConnection ($con) {
   if($con -ne $null){$con.Dispose()}
}

