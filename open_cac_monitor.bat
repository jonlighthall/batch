:: open_cac_monitor.bat - launch cac-monitor.ps1 if not already running

@echo off
setlocal

set "QUIET_MODE="
if /I "%~1"=="/Q" set "QUIET_MODE=1"

for %%I in ("%~dp0..\powershell\cac-monitor.ps1") do set "CAC_MONITOR_PATH=%%~fI"

if not exist "%CAC_MONITOR_PATH%" (
    echo cac-monitor.ps1 not found at "%CAC_MONITOR_PATH%"
    goto :footer
)

:: Check if cac-monitor is already running by checking command line arguments
wmic process where "name='powershell.exe' and CommandLine like '%%cac-monitor.ps1%%'" get ProcessId 2>nul | find /i "ProcessId" >nul && (
    echo cac-monitor.ps1 is running
) || (
    echo|set /p="opening cac-monitor.ps1... "
    start "CAC Monitor" powershell.exe -ExecutionPolicy Bypass -File "%CAC_MONITOR_PATH%" && (echo OK) || (echo FAIL)
)

:footer
if defined QUIET_MODE goto :eof
echo:
echo|set /p="goodbye"
timeout /t 3
