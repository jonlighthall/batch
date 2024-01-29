@echo off
SET STARTDIR="%cd%"
echo|set /p="opening... "
start powershell -ExecutionPolicy Unrestricted -File "%USERPROFILE%\Documents\powershell\scrlk.ps1" && (echo OK) || (echo FAIL)

echo:
echo|set /p="goodbye"
timeout /t 5