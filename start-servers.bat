@echo off
echo.
echo ===================================
echo   Rail Madad Development Setup
echo ===================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.8+ and try again
    pause
    exit /b 1
)

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js 18+ and try again
    pause
    exit /b 1
)

echo Starting Rail Madad Development Servers...
echo.

REM Start Backend Server
echo [1/2] Starting Django Backend Server...
start "Rail Madad Backend" cmd /k "cd /d %~dp0backend && python manage.py runserver 8000"

REM Wait a moment for backend to start
timeout /t 3 /nobreak >nul

REM Start Frontend Server
echo [2/2] Starting React Frontend Server...
start "Rail Madad Frontend" cmd /k "cd /d %~dp0frontend && npm run dev"

echo.
echo ===================================
echo   Servers Starting Successfully!
echo ===================================
echo Backend:  http://localhost:8000
echo Frontend: http://localhost:5174
echo.
echo Press any key to close this window
pause >nul
