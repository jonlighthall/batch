@echo off
SET prog=notepad.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul || (start %prog%)
::exit