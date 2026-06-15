@echo off
echo GIF to Rainmeter Frames Extractor
echo ============================
echo.

REM Check if ffmpeg is available
where ffmpeg >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: ffmpeg not found in PATH.
    echo Please install ffmpeg and make sure it's in your system PATH.
    echo Download from: https://ffmpeg.org/download.html
    pause
    exit /b
)

REM Get the directory of this batch file
set "SCRIPT_DIR=%~dp0"

REM Create frames directory if it doesn't exist
if not exist "%SCRIPT_DIR%frames" mkdir "%SCRIPT_DIR%frames"

REM Clean previous frames
del "%SCRIPT_DIR%frames\*.png" 2>nul

echo Extracting frames from input.gif...
echo This may take a moment...

REM Extract frames from GIF using a simpler approach
ffmpeg -i "%SCRIPT_DIR%input.gif" "%SCRIPT_DIR%frames\frame%%d.png" -y

REM Count the number of frames extracted
set /a count=0
for %%f in ("%SCRIPT_DIR%frames\frame*.png") do set /a count+=1

echo.
echo Extraction complete! Found %count% frames.
echo.
echo IMPORTANT: Update the FrameCount value in RainGIF.ini to %count%
echo.
pause
