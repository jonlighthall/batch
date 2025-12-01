:: open_progs.bat - open commonly used programs

:: DESCRIPTION the status of the programs listed below are checked, and if the
::   target program is not running, it is opened. This script is used instead of
::   adding programs to the Startup path to improve startup speed.

@echo off

:: Detect Office installation
call detect_office.bat
if errorlevel 1 (
    echo Warning: Office not found, some programs may not launch
    set "OFFICE_DIR=C:\Program Files (x86)\Microsoft Office\Office16"
)

SET prog_dir="%PROGRAMFILES%\Microsoft OneDrive"
SET prog=OneDrive.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% is running) || (
    echo|set /p="opening %prog%... "
    start /D %prog_dir% %prog% && (echo OK) || (echo FAIL)
)

SET prog=ms-teams.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% is running) || (
    echo|set /p="opening %prog%... "
    start %prog% && (echo OK) || (echo FAIL)
)

SET prog_dir="%OFFICE_DIR%"
FOR %%x IN (ONENOTE.EXE OUTLOOK.EXE) DO (
    tasklist /nh /fi "imagename eq %%x" | find /i "%%x" > nul && (echo %%x is running) || (
		echo|set /p="opening %%x... "
        start /D %prog_dir% %%x && (echo OK) || (echo FAIL)
    )
)

:: Check if cac-monitor is already running by checking command line arguments
wmic process where "name='powershell.exe' and CommandLine like '%%cac-monitor.ps1%%'" get ProcessId 2>nul | find /i "ProcessId" >nul && (echo cac-monitor.ps1 is running) || (
    echo|set /p="opening cac-monitor.ps1... "
    start "CAC Monitor" powershell.exe -ExecutionPolicy Bypass -File "C:\Users\jlighthall\Documents\home\ubuntu\repos\powershell\cac-monitor.ps1" && (echo OK) || (echo FAIL)
)

:: Check if wsl-vpnkit is already running by checking inside the distro
wsl.exe -d wsl-vpnkit --exec sh -c "pgrep -f '/app/wsl-vm' >/dev/null 2>&1" && (echo wsl-vpnkit is running) || (
    echo|set /p="opening wsl-vpnkit... "
    start "wsl-vpnkit" wsl.exe -d wsl-vpnkit --cd /app wsl-vpnkit && (echo OK) || (echo FAIL)
)

echo:
echo|set /p="goodbye"
timeout /t 15
