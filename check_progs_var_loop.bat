@echo OFF
FOR %%x IN (notepad.exe mspaint.exe) DO (
    echo|set /p="opening %%x... "
    tasklist /nh /fi "imagename eq %%x" | find /i "%%x" > nul || (start %%x)
    )

echo:
echo|set /p="goodbye"
timeout /t 5