# Update-Task

```powershell
Update-Task alias:update,udp
    [ID] <String>
    [-taskName] <String>
    [-startAt] <String>
    [-endAt] <String>
    [-createAt] <String>
    [-updateAt] <String>
    [-project] <String>
    [-tag] <String>
    [-state] <String>
    [-priority] <String>

```

## Description

Update the task. The target is specified the id and option. 

## Examples

examples 1 : Update task Name

```powershell
> task update-task 1 -taskName "test task 2"
```

examples 2 : Update Start Date

```powershell
> task update-task 1 -startDt "2018/05/10"
```
examples 3 : Update Start Date

```powershell
> task update-task 1 -startDt "2018/05/10"
```