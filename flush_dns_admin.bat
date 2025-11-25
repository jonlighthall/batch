@echo off
:: flush DNS cache

:: run from WSL with
::  cmd.exe /c flush_dns_admin.bat

echo WARNING: This script requires administrator privileges
echo:
echo This will perform network operations:
echo  - Flush DNS cache
echo  - Register DNS (requires elevation)
echo  - Release and renew IP address (brief network interruption)
echo  - Reset Winsock catalog (requires elevation)
echo:
echo Press Ctrl+C to cancel or
pause

ipconfig /flushdns
:: requires elevation
ipconfig /registerdns
ipconfig /release
ipconfig /renew
:: requires elevation
netsh winsock reset

echo:
echo DNS flush and network reset complete.
pause
