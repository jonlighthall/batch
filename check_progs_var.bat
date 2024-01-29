@echo off
SET prog=notepad.exe
tasklist /nh /fi "imagename eq %prog%" | find /i "%prog%" > nul && (echo %prog% is running) || (
    echo|set /p="opening %prog%... "
    (start %prog%) && (echo OK) || (echo FAIL)
)
echo:
echo|set /p="goodbye"
timeout /t 5