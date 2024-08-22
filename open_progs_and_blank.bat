:: open_progs_and_blank.bat - open commonly used programs and launch blank.ppsx

:: DESCRIPTION the status of the programs listed below are checked, and if the target program is
::   not running, it is opened. This script is used instad of adding programs to the Startup path
::   to improve startup speed.

@echo off
SET STARTDIR="%cd%"
:: declare counters
set /a count_launch=0
set /a count_login=0
SET prog_dir="%PROGRAMFILES%\Microsoft OneDrive"
SET prog=OneDrive.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% is running) || (
	set /a count_launch+=1
    set /a count_login+=1
    echo|set /p="opening %prog%... "
    start /D %prog_dir% %prog% && (echo OK) || (echo FAIL)
)

SET prog=ms-teams.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% is running) || (
	set /a count_launch+=1
	set /a count_login+=1
    echo|set /p="opening %prog%... "
    start %prog% && (echo OK) || (echo FAIL)
    )

SET prog_dir = "C:\Program Files (x86)\Microsoft Office\Office16"
FOR %%x IN (ONENOTE.EXE OUTLOOK.EXE) DO (
    tasklist /nh /fi "imagename eq %%x" | find /i "%%x" > nul && (echo %%x is running) || (
	set /a count_launch+=1
    echo|set /p="opening %%x... "
        start /D %prog_dir% %%x && (echo OK) || (echo FAIL)
        )
    )

SET prog=POWERPNT.EXE
SET ppt="%OneDrive%\Desktop\blank.ppsx"
    tasklist /v /fi "imagename eq %prog%" /fi "username eq %USERDOMAIN%\%USERNAME%" | find /i "blank.ppsx" > nul && (echo %ppt% open) || (
    	echo opening %ppt%...
    	if (%count_launch% GTR 0) (
    	   echo calculating wait...
    	   echo count_launch = %count_launch%
    	   set /a do_wait=15
    	   echo do_wait = %do_wait%
    	   if %count_login% GTR 0 (
    	   	  echo count_login = %count_login%
    	   	  set /a do_wait+=(20*%count_login%)
    	   	  echo do_wait = %do_wait%
    	   )
    	   echo waiting %do_wait%...
    	   timeout /t %do_wait%
    	)
        echo ready to open %prog%
        echo|set /p="opening %ppt%... "
        start powershell -ExecutionPolicy Unrestricted -File "%USERPROFILE%\Documents\powershell\blank.ps1" && (echo OK) || (echo FAIL)
    )

echo:
echo|set /p="goodbye"
timeout /t 5
pause
