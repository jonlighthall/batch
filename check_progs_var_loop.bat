@echo off
FOR %%x IN (notepad.exe mspaint.exe) DO (
    tasklist /nh /fi "imagename eq %%x" | find /i "%%x" > nul && (echo %%x is running) || (
        echo|set /p="opening %%x... "
        (start %%x)  && (echo OK) || (echo FAIL)
    )
)
echo:
echo|set /p="goodbye"
timeout /t 5
