# task

## Overview

task is Todo List manager on CLI

## Requirements

- powershell  3.0 or later
- .Net Framework 3.0 or later

## Dependencies

- Microsoft Access database engine 2010

## Usage

```powershell
'task' Add-Task taskName -startDt <yyyy/MM/dd> -endDt <yyyy/MM/dd> -priority <(A) to (E)>
'task' update-task ID [-taskName] <taskName> [-startDt] <yyyy/MM/dd> [-endDt]<yyyy/MM/dd>  [-project] <projectName> [-tag] <context Name> [-state] <state> [-priority] <(A) to (E)>
```

remove-task|rm,remove|remove task
show-task|ls,show| Display TaskList
check-task|check,chk|Toggle state column value

## Table Desgin

Name|Type|Remark
:--:|:--:|:--:
ID|integer|Auto Incriment
taskName|String
startDt|String|yyyy/MM/dd hh:mm:ss
endDt|String|yyyy/MM/dd hh:mm:ss
createAt|String|yyyy/MM/dd hh:mm:ss|
updateAt|String|yyyy/MM/dd hh:mm:ss
project|String
tag|String
state|bit|0:Uncheck  1:Checked
priority|String| (A) between (E)

Note
Priority:A is most higher and E is most lower.

