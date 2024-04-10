@echo off
set KIOSKID="PTK-001"
set LINK1="https://leaderboard.projectteho.com?kioskId=%KIOSKID%"
set LINK2="https://leaderboard.projectteho.com"
ping -n 1 youtube.com 
if %errorlevel% == 0 goto action1
goto connectWifi
:connectWifi 
netsh wlan connect IKP-1stFloor
goto wait1
:wait1
ping -n 1 youtube.com
echo "%errorlevel%"
if %errorlevel% == 0 goto action1
goto wait1
:action1
start msedge --new-window --kiosk "https://leaderboard.projectteho.com?kioskId=%KIOSKID%"  --edge-kiosk-type=fullscreen 
 