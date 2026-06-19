@echo off
cd /d "%~dp0"
echo Diagnostic FundFlow > diagnostic_fundflow.log
echo Date: %date% %time% >> diagnostic_fundflow.log
echo. >> diagnostic_fundflow.log
where python >> diagnostic_fundflow.log 2>&1
python --version >> diagnostic_fundflow.log 2>&1
echo. >> diagnostic_fundflow.log
python app.py --no-browser >> diagnostic_fundflow.log 2>&1
pause
