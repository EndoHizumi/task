[void][System.Reflection.Assembly]::LoadFile((Join-Path ($PSScriptRoot) "System.Data.SQLite.dll"))
function getConnection($db){
    $sqlite = New-Object System.Data.SQLite.SQLiteConnection
    $sqlite.ConnectionString = "Data Source = $db"
    return $sqlite
}

function createTable($tableDefiniationFile){
    
}

<#
 in:[String] specified column. 
 out:
#>
function Run-Select($col){

}

function Run-Insert(){

}
function Run-Update(){

}
function Run-Where(){

}

function Run-WhereOr(){

}

function  Run-Delete() {
    
}

# クエリオブジェクト配列を走査し、SQLクエリ文を生成する。
# [ select | update | delete | insert into table( ] col [ ) values(value)] [from] table [where] option
function runQuery($query,$connection){
    try{
        $sqlcom =  New-Object System.Data.SQLite.SQLiteCommand
        if ($connection.state -eq "Closed") {$connection.Open()}
        $sqlcom.Connection = $connection
        $sqlcom.CommandText  = $query
        $sqlcom.ExecuteReader()
    }catch{
        throw
    }finally{  
    }
}

function disposeConnection ($con) {
   if($con -ne $null){$con.Dispose()}
}

