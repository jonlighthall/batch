@echo off
tasklist /nh /fi "imagename eq notepad.exe" | find /i "notepad.exe" > nul || (start notepad.exe)
::exit