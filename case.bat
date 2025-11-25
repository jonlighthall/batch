:: case.bat - performance test for batch loop case sensitivity

:: DESCRIPTION this script tests whether loop syntax case affects execution
::   speed. It compares uppercase (FOR /L %%I) versus lowercase (for /l %%i) by
::   running four test iterations of 1000 echo commands. Each iteration
::   alternates between uppercase and lowercase syntax while measuring elapsed
::   time. All results are logged to check.txt in the current directory.

@echo off

echo %time% start>"%cd%\check.txt"

rem Get start time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
set /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

echo %start%
echo %start% start>>"%cd%\check.txt"

FOR /L %%I in (1,1,1000) DO ECHO %%I
@echo %time% after run 1, upper>>"%cd%\check.txt"

rem Get end time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)
echo %end%
echo %end% end>>"%cd%\check.txt"

rem Get elapsed time:
set /A elapsed=end-start
echo %elapsed%
echo %elapsed% elap>>"%cd%\check.txt"

for /l %%i in (1,1,1000) do echo %%i
@echo %time% after run 2, lower>>"%cd%\check.txt"

rem Get end time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)
echo %end%
echo %end% end>>"%cd%\check.txt"

rem Get elapsed time:
set /A elapsed=end-start
echo %elapsed%
echo %elapsed% elap>>"%cd%\check.txt"

FOR /L %%I in (1,1,1000) DO ECHO %%I
echo %time% after run 3, upper>>"%cd%\check.txt"

rem Get end time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)
echo %end%
echo %end% end>>"%cd%\check.txt"

rem Get elapsed time:
set /A elapsed=end-start
echo %elapsed%
echo %elapsed% elap>>"%cd%\check.txt"

for /l %%i in (1,1,1000) do echo %%i
echo %time% after run 4, lower>>"%cd%\check.txt"

rem Get end time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)
echo %end%
echo %end% end>>"%cd%\check.txt"

rem Get elapsed time:
set /A elapsed=end-start
echo %elapsed%
echo %elapsed% elap>>"%cd%\check.txt"

rem Get end time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)
echo %end%
echo %end% end>>"%cd%\check.txt"

rem Get elapsed time:
set /A elapsed=end-start
echo %elapsed%
echo %elapsed% elap>>"%cd%\check.txt"

rem Show elapsed time:
set /A hh=elapsed/(60*60*100), rest=elapsed%%(60*60*100), mm=rest/(60*100), rest%%=60*100, ss=rest/100, cc=rest%%100
if %mm% lss 10 set mm=0%mm%
if %ss% lss 10 set ss=0%ss%
if %cc% lss 10 set cc=0%cc%
echo %hh%:%mm%:%ss%,%cc%
echo %hh%:%mm%:%ss%,%cc% elap>>"%cd%\check.txt"
