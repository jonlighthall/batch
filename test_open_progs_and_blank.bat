@echo off

echo WARNING: This will close PowerPoint and PowerShell processes
echo:
echo Press Ctrl+C to cancel or
pause

FOR %%x IN (POWERPNT.EXE powershell.exe) DO (
	tasklist /fi "username eq %USERNAME%" /fi "imagename eq %%x" && (echo find %%x OK) || (echo find %%x FAIL)
	taskkill /fi "username eq %USERNAME%" /fi "imagename eq %%x" && (echo kill %%x OK) || (echo kill %%x FAIL)
)
start open_progs_and_blank.bat
echo:
echo|set /p="goodbye"
timeout /t 5
