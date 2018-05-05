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

Update the Todo.The target is specified the id.

## Examples

examples : Update task Name

```powershell
> task update-task 1 -taskName "test task 2"
```