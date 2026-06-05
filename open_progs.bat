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

call "%~dp0open_cac_monitor.bat" /Q
call "%~dp0open_vpn.bat" /Q

echo:
echo|set /p="goodbye"
timeout /t 15
