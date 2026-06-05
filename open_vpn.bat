:: open_vpn.bat - launch wsl-vpnkit if not already running

@echo off
setlocal

set "QUIET_MODE="
if /I "%~1"=="/Q" set "QUIET_MODE=1"

:: Check if wsl-vpnkit is already running by checking inside the distro
wsl.exe -d wsl-vpnkit --exec sh -c "pgrep -f '/app/wsl-vm' >/dev/null 2>&1" && (echo wsl-vpnkit is running) || (
    echo|set /p="opening wsl-vpnkit... "
    start "wsl-vpnkit" wsl.exe -d wsl-vpnkit --cd /app wsl-vpnkit && (echo OK) || (echo FAIL)
)

if defined QUIET_MODE goto :eof
echo:
echo|set /p="goodbye"
timeout /t 3
