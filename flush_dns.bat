:: flush DNS cache

:: run from WSL with
::  cmd.exe /c flush_dns.bat

ipconfig /flushdns
ipconfig /release
ipconfig /renew
