@echo off
title 3S Verse POS - Build the .exe
color 0a
echo ============================================================
echo          3S Verse POS System  -  Building Windows .exe
echo ============================================================
echo.
where node >nul 2>nul
if %errorlevel% neq 0 (
  echo  [X] Node.js is NOT installed.
  echo.
  echo  Do this once:
  echo    1. Open https://nodejs.org
  echo    2. Download the "LTS" version and install it (Next, Next, Finish)
  echo    3. Close this window and double-click BUILD-EXE.bat again
  echo.
  pause
  exit /b
)
echo  [1/2] Installing components (first time takes a few minutes)...
call npm install
if %errorlevel% neq 0 ( echo  [X] Install failed. Check your internet. & pause & exit /b )
echo.
echo  [2/2] Building the .exe ...
call npm run dist
if %errorlevel% neq 0 ( echo  [X] Build failed. & pause & exit /b )
echo.
echo ============================================================
echo   DONE! Your installer is in the "dist" folder:
echo     - 3SVerse-POS-Setup-1.0.0.exe       (installer)
echo     - 3SVerse-POS-Portable-1.0.0.exe    (no install needed)
echo ============================================================
explorer dist
pause
