@echo off
SET STARTDIR="%cd%"
SET prog_dir="%LOCALAPPDATA%\Microsoft\OneDrive"
SET prog=OneDrive.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% is running) || (
    echo opening %prog%...
    start /D %prog_dir% %prog% && (echo OK) || (echo FAIL)
)

SET prog_dir="%LOCALAPPDATA%\Microsoft\Teams"
SET prog=Teams.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% is running) || (
    echo opening %prog%...
    start /D %prog_dir% Update.exe --processStart "%prog%" && (echo OK) || (echo FAIL)    
    )

SET prog_dir = "C:\Program Files (x86)\Microsoft Office\Office16"
FOR %%x IN (ONENOTE.EXE OUTLOOK.EXE) DO (
    tasklist /nh /fi "imagename eq %%x" | find /i "%%x" > nul && (echo %%x is running) || (
echo opening %%x...
        start /D %prog_dir% %%x && (echo OK) || (echo FAIL)
        )
    )

SET prog=POWERPNT.EXE
::SET ppt_dir=
SET ppt="%OneDrive%\Desktop\blank.ppsx"
    tasklist /v /fi "imagename eq %prog%" /fi "username eq %USERDOMAIN%\%USERNAME%" | find /i "blank.ppsx" > nul && (echo %ppt% open) || (
        echo opening %ppt%...
        echo ready to open %prog%...
        timeout /t 75
        ::start /D %prog_dir% %prog% /S %ppt% && (echo OK) || (echo FAIL)
        start powershell -ExecutionPolicy Unrestricted -File "%USERPROFILE%\Documents\powershell\blank.ps1" && (echo OK) || (echo FAIL)
    )

echo goodbye
sleep 0.500
::exit