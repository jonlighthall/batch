@echo off
SET STARTDIR="%cd%"
cd "C:\Users\jlighthall\AppData\Local\Microsoft\OneDrive"
SET prog=OneDrive.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul || (start %prog%)

cd "C:\Users\jlighthall\AppData\Local\Microsoft\Teams"
start Update.exe --processStart "Teams.exe"

cd "C:\Program Files (x86)\Microsoft Office\Office16"
FOR %%x IN (ONENOTE.EXE OUTLOOK.EXE) DO (
    tasklist /nh /fi "imagename eq %%x" | find /i "%%x" > nul ||(start %%x)
    )
cd %STARTDIR%
::exit