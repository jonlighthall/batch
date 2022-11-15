@echo off
SET prog_dir = "C:\Program Files (x86)\Microsoft Office\Office16"
SET prog=POWERPNT.EXE
::SET ppt_dir=
SET ppt="%OneDrive%\Desktop\blank.ppsx"
    tasklist /v /fi "imagename eq %prog%" /fi "username eq %USERDOMAIN%\%USERNAME%" | find /i "blank.ppsx" > nul && (echo %ppt% open) || (
        echo opening %ppt%...
        echo ready to open %prog%...        
        ::start /D %prog_dir% %prog% /S %ppt% && (echo OK) || (echo FAIL)
        start powershell -ExecutionPolicy Unrestricted -File "%USERPROFILE%\Documents\powershell\blank.ps1" && (echo OK) || (echo FAIL)
    )

echo goodbye
timeout /t 5
::exit
