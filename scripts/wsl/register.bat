@echo off
cd /d %~dp0
for /f "tokens=3 delims=\ " %%i in ('whoami /groups^|find "Mandatory"') do set LEVEL=%%i
if NOT "%LEVEL%"=="High" (
    @powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process %~f0 -Verb runas"
    exit
)


schtasks /create /tn %username%\wsl-startup /tr %~dp0startup.bat /sc onstart /rl highest /ru system /delay 0000:30

pause
