@echo off
set KIOSKID="PTK-001"
set LINK1="https://leaderboard.projectteho.com?kioskId=%KIOSKID%"
set LINK2="https://leaderboard.projectteho.com/leaderboardall?branchid=643d004672d90769fb4aa047&gameid=643d08855731092343955149"
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
start "" "C:\Program Files\Mozilla Firefox\firefox.exe" --kiosk --new-window %LINK2%
