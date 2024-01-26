@echo off
setlocal enabledelayedexpansion
(for /f "tokens=*" %%a in (build.txt) do (
    set "line=%%a"
    set "line=!line: =!"
    echo|set /p=!line!
)) > temp.txt
move /y temp.txt build.txt
