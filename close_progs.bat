:: close_progs.bat - close commonly used programs

:: DESCRIPTION the status of the programs listed below are checked, and if the
::   target program is running, it is closed gracefully using taskkill.

@echo off

SET prog=ms-teams.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (
    echo|set /p="closing %prog%... "
    taskkill /im %prog% > nul 2>&1 && (echo OK) || (echo FAIL)
) || (echo %prog% is not running)

SET prog=OUTLOOK.EXE
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (
    echo|set /p="closing %prog%... "
    taskkill /im %prog% > nul 2>&1 && (echo OK) || (echo FAIL)
) || (echo %prog% is not running)

:: Close cac-monitor PowerShell window by window title
tasklist /nh /fi "imagename eq powershell.exe" /fi "windowtitle eq *cac-monitor*" | find /i "powershell.exe" > nul && (
    echo|set /p="closing cac-monitor.ps1... "
    for /f "tokens=2" %%a in ('tasklist /nh /fi "imagename eq powershell.exe" /v ^| findstr /i "cac-monitor"') do taskkill /pid %%a > nul 2>&1
    echo OK
) || (echo cac-monitor.ps1 is not running)

echo:
echo|set /p="goodbye"
timeout /t 5
