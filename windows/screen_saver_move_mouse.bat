@echo off
title Mouse Mover
echo 마우스를 미세하게 움직여 화면 보호기를 예방하는 중입니다...
echo (이 창을 닫으면 종료됩니다.)

powershell -NoProfile -Command "^
$wsh = New-Object -ComObject Wscript.Shell; ^
while ($true) { ^
    $wsh.SendKeys('{F15}'); ^
    Start-Sleep -Seconds 60; ^
}"