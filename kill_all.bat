@echo off
echo WARNING: This will kill all processes using over 100MB RAM except explorer.exe
echo:
echo Press Ctrl+C to cancel or
pause

taskkill /fi "username eq %USERNAME%" /fi "memusage gt 100000" /fi "imagename ne explorer.exe"

echo:
echo Done.
pause
