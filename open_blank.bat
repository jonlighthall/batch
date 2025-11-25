@echo off

:: Detect Office installation
call detect_office.bat
if errorlevel 1 (
    echo Warning: Office not found
    set "OFFICE_DIR=C:\Program Files (x86)\Microsoft Office\Office16"
)

SET prog_dir="%OFFICE_DIR%"
SET prog=POWERPNT.EXE
SET ppt="%OneDrive%\Desktop\blank.ppsx"
tasklist /v /fi "imagename eq %prog%" /fi "username eq %USERDOMAIN%\%USERNAME%" | find /i "blank.ppsx" > nul && (echo %ppt% open) || (
    echo ready to open %prog%...
    echo|set /p="opening %ppt%... "
    start powershell -ExecutionPolicy Unrestricted -File "%USERPROFILE%\Documents\powershell\blank.ps1" && (echo OK) || (echo FAIL)
)
echo goodbye
timeout /t 5
