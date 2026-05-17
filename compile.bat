@echo off
title Joy Markdown Studio Compiler
color 0B
echo =======================================================================
echo   Joy Markdown Studio v3.5 Standalone Executable Compiler
echo =======================================================================
echo.
echo [Step 1] Checking Python Environment...
C:\Python\Python313\python.exe --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python 3.13 was not found in C:\Python\Python313\.
    echo Trying default system 'python' command instead...
    python --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo [ERROR] Python is not installed or not in system PATH!
        echo Please install Python and try again.
        pause
        exit /b
    )
    set PY_CMD=python
) else (
    set PY_CMD=C:\Python\Python313\python.exe
)

echo.
echo [Step 2] Installing/Upgrading required libraries (PyInstaller, pywebview, bottle, Pillow)...
%PY_CMD% -m pip install --upgrade pip
%PY_CMD% -m pip install --upgrade pyinstaller bottle pywebview Pillow
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install required libraries. Please check internet connection.
    pause
    exit /b
)

echo.
echo [Step 3] Compiling jmstudio.py into a Standalone Executable...
echo (This may take 1-2 minutes. Please do not close this window...)
%PY_CMD% -m PyInstaller --clean --noconfirm --onefile --windowed --icon=app_icon.ico --name="JoyMarkdownStudio" jmstudio.py
if %errorlevel% neq 0 (
    echo [ERROR] PyInstaller compilation failed!
    pause
    exit /b
)

echo.
echo =======================================================================
echo   SUCCESS: Standalone executable compiled successfully!
echo =======================================================================
echo.
echo The compiled executable is saved at:
echo   =^> e:\jm_studio\dist\JoyMarkdownStudio.exe
echo.
echo [Distribution Guide]
echo 1. Copy 'JoyMarkdownStudio.exe' from the 'dist' folder.
echo 2. Paste and run it on any external Windows PC directly!
echo 3. No Python or extra library installations are needed.
echo.
pause
