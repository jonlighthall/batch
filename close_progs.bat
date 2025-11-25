:: close_progs.bat - close commonly used programs

:: DESCRIPTION the status of the programs listed below are checked, and if the
::   target program is running, it is closed gracefully using taskkill.

@echo off
SET STARTDIR="%cd%"

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

echo:
echo|set /p="goodbye"
timeout /t 5
