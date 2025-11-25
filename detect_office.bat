:: detect_office.bat - detect Microsoft Office installation path

:: DESCRIPTION finds the Microsoft Office installation directory by checking
::   common installation locations. Sets OFFICE_DIR variable with the path.
::   Checks in order: 64-bit Office 365/2021, 64-bit Office 2016, 32-bit Office.

@echo off
setlocal enabledelayedexpansion

:: Check for Office 365/2021/2019 (64-bit) - Microsoft 365 Click-to-Run
if exist "C:\Program Files\Microsoft Office\root\Office16" (
    set "OFFICE_DIR=C:\Program Files\Microsoft Office\root\Office16"
    goto :found
)

:: Check for Office 365/2021/2019 (64-bit) - older location
if exist "C:\Program Files\Microsoft Office\root\Office15" (
    set "OFFICE_DIR=C:\Program Files\Microsoft Office\root\Office15"
    goto :found
)

:: Check for Office 2016/2019 (32-bit)
if exist "C:\Program Files (x86)\Microsoft Office\Office16" (
    set "OFFICE_DIR=C:\Program Files (x86)\Microsoft Office\Office16"
    goto :found
)

:: Check for Office 2013 (32-bit)
if exist "C:\Program Files (x86)\Microsoft Office\Office15" (
    set "OFFICE_DIR=C:\Program Files (x86)\Microsoft Office\Office15"
    goto :found
)

:: Check for Office 2010 (32-bit)
if exist "C:\Program Files (x86)\Microsoft Office\Office14" (
    set "OFFICE_DIR=C:\Program Files (x86)\Microsoft Office\Office14"
    goto :found
)

:: Not found
echo ERROR: Microsoft Office installation not found
endlocal
exit /b 1

:found
endlocal & set "OFFICE_DIR=%OFFICE_DIR%"
exit /b 0
