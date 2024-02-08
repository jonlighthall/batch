:: open_progs.bat - open commonly used programs

:: DESCRIPTION the status of the programs listed below are checked, and if the target program is
::   not running, it is opened. This script is used instad of adding programs to the Startup path
::   to improve startup speed.

@echo off
SET STARTDIR="%cd%"
SET prog_dir="%LOCALAPPDATA%\Microsoft\OneDrive"
SET prog=OneDrive.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% is running) || (
    echo|set /p="opening %prog%... "
    start /D %prog_dir% %prog% && (echo OK) || (echo FAIL)
)

SET prog_dir="%LOCALAPPDATA%\Microsoft\Teams"
SET prog=Teams.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% is running) || (
    echo|set /p="opening %prog%... "
    start /D %prog_dir% Update.exe --processStart "%prog%" && (echo OK) || (echo FAIL)    
)

SET prog_dir = "C:\Program Files (x86)\Microsoft Office\Office16"
FOR %%x IN (ONENOTE.EXE OUTLOOK.EXE) DO (
    tasklist /nh /fi "imagename eq %%x" | find /i "%%x" > nul && (echo %%x is running) || (
		echo|set /p="opening %%x... "
        start /D %prog_dir% %%x && (echo OK) || (echo FAIL)
    )
)

echo:
echo|set /p="goodbye"
timeout /t 5
