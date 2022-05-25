@echo off

wsl -d Ubuntu -u root -- service cron start
wsl -d Ubuntu -u root -- service dbus start
wsl -d Ubuntu -u root -- service ssh start
wsl -d Ubuntu -u root -- service nginx start
wsl -d Ubuntu -u root -- service mysql start
