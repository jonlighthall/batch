@echo off
SET prog=notepad.exe
echo|set /p="opening %prog%... "
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul || (start %prog%)

echo:
echo|set /p="goodbye"
timeout /t 5