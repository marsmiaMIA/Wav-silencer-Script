@echo off
setlocal enabledelayedexpansion

echo ================================
echo  WAV Silencer - requires ffmpeg
echo ================================
echo.

:: Check ffmpeg is available
where ffmpeg >nul 2>&1
if errorlevel 1 (
    echo ERROR: ffmpeg not found. Please install it from https://ffmpeg.org/download.html
    echo        and make sure it's added to your PATH.
    pause
    exit /b 1
)

:: Use folder passed as argument, or current folder if none given
set "TARGET=%~1"
if "%TARGET%"=="" set "TARGET=%~dp0"

echo Processing folder: %TARGET%
echo.

set COUNT=0
set ERRORS=0

for %%f in ("%TARGET%\*.wav") do (
    echo Silencing: %%~nxf
    ffmpeg -y -i "%%f" -af "volume=0" -ar 44100 "%%f.tmp.wav" >nul 2>&1
    if errorlevel 1 (
        echo   [FAILED] Could not process %%~nxf
        set /a ERRORS+=1
        if exist "%%f.tmp.wav" del "%%f.tmp.wav"
    ) else (
        move /y "%%f.tmp.wav" "%%f" >nul
        set /a COUNT+=1
        echo   [OK]
    )
)

echo.
echo ================================
echo  Done! Silenced: %COUNT% file(s)
if %ERRORS% gtr 0 echo  Errors:   %ERRORS% file(s)
echo ================================
pause
