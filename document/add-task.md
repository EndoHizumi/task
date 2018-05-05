# Add-Task

```powershell
Add-Task alias:add
[-taskName @ContextName +projectName] <String>
[-startDay] <String>
[-endDay] <String>
[-priority] <String>
```

## Description

Insert task to TaskList.
If priority is omitted, priority medium is set. if startDay is omitted,  today is set.

## Examples

Example1: add task "Test task"

```powershell
task Add-Task "Test task"
```

Example2: add task "Test task" append start Date

```powershell
task Add-Task "Test task" "2018/05/05"
```

Example3: add task "Test task" append start Date and end Date

```powershell
task Add-Task "Test task" "2018/05/05" "2018/05/05"
```

Example4: add task "Test task" apeend priority

```powershell
task Add-Task "Test task" -priority "(A)"
```