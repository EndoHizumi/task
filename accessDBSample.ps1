$db = Join-Path (pwd).Path "taskListDB.accdb"

try{
    $db = New-Object System.Data.Odbc.OdbcConnection("Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=$db;")
    $query = New-Object System.Data.Odbc.OdbcCommand("select * from tasklist", $db)
    $db.Open()
    $reader = $query.ExecuteReader()
    $reader.getType()
    while($reader.Read()){
        Write-Host ("{0}`t{1}" -f $reader[0], $reader[1])
    }
}catch{
    $Error
}finally{
    $reader.Close()
}