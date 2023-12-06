:: check disk
chkdsk.exe /F
:: system file checker
sfc /scannow
:: repair Windows image
Dism /Online /Cleanup-Image /CheckHealth
Dism /Online /Cleanup-Image /ScanHealth
Dism /Online /Cleanup-Image /RestoreHealth
