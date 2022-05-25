@echo off

wsl -u root -- service cron start
wsl -u root -- service dbus start
wsl -u root -- service ssh start
wsl -u root -- service nginx start
wsl -u root -- service mysql start
