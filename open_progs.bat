@echo off
SET STARTDIR="%cd%"
cd "C:\Users\jlighthall\AppData\Local\Microsoft\OneDrive"
SET prog=OneDrive.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% running) || (
    echo opening %prog%...
    start %prog% && (echo OK) || (echo FAIL)
)

cd "C:\Users\jlighthall\AppData\Local\Microsoft\Teams"
SET prog=Teams.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% running) || (
    echo opening %prog%...
    start Update.exe --processStart "%prog%" && (echo OK) || (echo FAIL)    
    )

cd "C:\Program Files (x86)\Microsoft Office\Office16"
FOR %%x IN (ONENOTE.EXE OUTLOOK.EXE) DO (
    tasklist /nh /fi "imagename eq %%x" | find /i "%%x" > nul && (echo %%x running) || (
        echo opening %%x...
        start %%x && (echo OK) || (echo FAIL)
        )
    )
cd %STARTDIR%
::exit