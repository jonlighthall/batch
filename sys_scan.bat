@echo off
:: all of the following commands require elevated permissions

echo WARNING: This script requires administrator privileges
echo:
echo This will run system diagnostics and repairs:
echo  - Check Disk (chkdsk /F) - requires restart
echo  - System File Checker (sfc /scannow)
echo  - DISM Image Health Check and Repair
echo:
echo Press Ctrl+C to cancel or
pause

:: check disk
chkdsk.exe /F
:: system file checker
sfc /scannow
:: repair Windows image
Dism /Online /Cleanup-Image /CheckHealth
Dism /Online /Cleanup-Image /ScanHealth
Dism /Online /Cleanup-Image /RestoreHealth

echo:
echo System scan complete.
pause
