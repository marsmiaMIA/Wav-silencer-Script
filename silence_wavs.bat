@echo off
setlocal enabledelayedexpansion

:: ================================================================
::  WAV Volume Reducer - requires ffmpeg
::  https://ffmpeg.org/download.html
:: ================================================================
::
::  VOLUME LEVEL - change the number below to adjust reduction:
::
::    0.10 = 90% quieter  (very quiet)
::    0.15 = 85% quieter
::    0.25 = 75% quieter  (default)
::    0.50 = 50% quieter  (mild)
::
set VOLUME=0.10
::
:: ================================================================

echo.
echo  WAV Volume Reducer
echo  Volume level: %VOLUME%
echo.

:: Check ffmpeg is available
where ffmpeg >nul 2>&1
if errorlevel 1 (
    echo ERROR: ffmpeg not found.
    echo        Install it from https://ffmpeg.org/download.html
    echo        and make sure it's added to your PATH.
    echo.
    pause
    exit /b 1
)

:: Use folder passed as argument, or current folder if none given
set "TARGET=%~1"
if "%TARGET%"=="" set "TARGET=%~dp0"

echo  Processing folder: %TARGET%
echo.

set COUNT=0
set ERRORS=0

for /r "%TARGET%" %%f in (*.wav) do (
    echo   Reducing: %%~nxf
    ffmpeg -y -i "%%f" -af "volume=%VOLUME%" "%%f.tmp.wav" >nul 2>&1
    if errorlevel 1 (
        echo   [FAILED] %%~nxf
        set /a ERRORS+=1
        if exist "%%f.tmp.wav" del "%%f.tmp.wav"
    ) else (
        move /y "%%f.tmp.wav" "%%f" >nul
        set /a COUNT+=1
        echo   [OK]
    )
)

echo.
echo  Done!  Reduced: %COUNT% file(s)
if %ERRORS% gtr 0 echo  Errors: %ERRORS% file(s)
echo.
pause
