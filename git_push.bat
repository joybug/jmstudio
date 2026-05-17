@echo off
title Joy Markdown Studio Git Pusher
color 0B
echo =======================================================================
echo   Joy Markdown Studio Git Initializer and Pusher
echo =======================================================================
echo.

rem Step 1: Initialize Git
if not exist .git (
    echo [Step 1] Initializing Git repository...
    git init
    if %errorlevel% neq 0 (
        echo [ERROR] Git is not installed or not in your system PATH!
        pause
        exit /b
    )
) else (
    echo [Step 1] Git repository already initialized.
)

rem Step 2: Set Remote Origin
echo.
echo [Step 2] Configuring remote repository URL...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/joyfoxg/jmstudio
if %errorlevel% neq 0 (
    echo [ERROR] Failed to set remote origin!
    pause
    exit /b
)
echo Remote origin set to: https://github.com/joyfoxg/jmstudio

rem Step 3: Stage and Commit
echo.
echo [Step 3] Staging and committing files...
git add .
git commit -m "Initial commit: Joy Markdown Studio v3.5"
if %errorlevel% neq 0 (
    echo [WARNING] Nothing to commit or commit failed.
)

rem Step 4: Push to Main Branch
echo.
echo [Step 4] Pushing to GitHub (https://github.com/joyfoxg/jmstudio)...
git branch -M main
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Push failed!
    echo Please make sure you are logged in to GitHub on your PC or have proper auth configurations.
    echo (You might need to sign-in via the GitHub login popup window)
    pause
    exit /b
)

echo.
echo =======================================================================
echo   SUCCESS: Repository pushed to GitHub successfully!
echo =======================================================================
echo.
pause
