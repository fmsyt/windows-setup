@echo off

cd /d %~dp0

call %~dp0daemon.bat
call %~dp0portforward.bat
