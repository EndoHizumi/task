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

## Example

Example1: add task "Test task"

```powershell
> task Add-Task "Test task"
```
[>> More example](document/add-task.md)

Example2: show tasks

```powershell
> task Show-Tasks

ID workName  workDay    updateAt            createAt            endAt project tag state priority
-- --------  -------    --------            --------            ----- ------- --- ----- --------
 1 test Task 2018/05/06 2018/05/06 20:03:05 2018/05/06 20:03:05                   False (C)


```
[>> More example](document/show-task.md)

Example3: check "Test task"

```powershell
> task Check-Task 1 
```
[>> More example](document/check-task.md)

Example4: Remove "Test task"

```powershell
> task Remove-Task 1 
```
[>> More example](document/remove-task.md)

Example5: Update "Test task"

```powershell
> task Update-Task 1 -startDt "2018/05/010"
```
[>> More example](document/update-task.md)



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

