@echo off
echo|set /p="opening notepad... "
tasklist /nh /fi "imagename eq notepad.exe" | find /i "notepad.exe" > nul && (echo %prog% is running) || (
    (start notepad.exe)  && (echo OK) || (echo FAIL)
)

echo:
echo|set /p="goodbye"
timeout /t 5