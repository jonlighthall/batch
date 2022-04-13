@echo OFF
FOR %%x IN (notepad.exe mspaint.exe) DO (
    tasklist /nh /fi "imagename eq %%x" | find /i "%%x" > nul ||(start %%x)
    )
::exit