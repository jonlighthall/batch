:: flush DNS cache

:: run from WSL with
::  cmd.exe /c flush_dns_admin.bat

ipconfig /flushdns
ipconfig /registerdns & :: requires elevation
ipconfig /release
ipconfig /renew
netsh winsock reset & :: requires elevation
