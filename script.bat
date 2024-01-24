@echo off
setlocal enabledelayedexpansion
(for /f "tokens=*" %%a in (pass.txt) do (
    set "line=%%a"
    set "line=!line: =!"
    echo|set /p=!line!
)) > temp.txt
move /y temp.txt pass.txt
