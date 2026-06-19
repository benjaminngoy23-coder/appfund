@echo off
setlocal
cd /d "%~dp0"
title FundFlow - Lancement local
cls
echo ============================================
echo      FUNDFLOW - LANCEMENT LOCAL WINDOWS
echo ============================================
echo.
where py >nul 2>nul
if %errorlevel%==0 (
    set PY=py
) else (
    where python >nul 2>nul
    if %errorlevel%==0 (
        set PY=python
    ) else (
        echo Python n'est pas installe ou n'est pas dans PATH.
        echo Installe Python 3.10 ou plus recent puis relance.
        pause
        exit /b 1
    )
)
%PY% app.py
pause
