@echo OFF
FOR %%x IN (POWERPNT.EXE powershell.exe) DO (    
    tasklist /fi "username eq jlighthall" /fi "imagename eq %%x" && (echo find %%x OK) || (echo find %%x FAIL)
    taskkill /fi "username eq jlighthall" /fi "imagename eq %%x" && (echo kill %%x OK) || (echo kill %%x FAIL)        
    )

start open_progs_and_blank.bat

echo:
echo|set /p="goodbye"
timeout /t 5