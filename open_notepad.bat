@echo off
tasklist /nh /fi "imagename eq notepad.exe" | find /i "notepad.exe" > nul || (start notepad.exe)

echo:
echo|set /p="goodbye"
timeout /t 5