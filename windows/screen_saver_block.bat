@echo off
title Screen Saver Blocker
echo 화면 보호기 실행을 감시하고 차단하는 중입니다...
echo (이 창을 닫으면 감시가 종료됩니다.)
echo.

:LOOP
:: 실행 중인 화면 보호기 프로세스(.scr)가 있는지 확인하고 강제 종료
taskkill /f /im *.scr >nul 2>&1

:: 1초 동안 대기 후 다시 확인
timeout /t 1 /nobreak >nul
goto LOOP