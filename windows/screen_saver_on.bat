@echo off
:: 화면 보호기 사용 설정
reg add "HKCU\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 1 /f

:: 변경된 레지스트리 설정을 시스템에 즉시 적용
rundll32.exe user32.dll, UpdatePerUserSystemParameters

echo 화면 보호기 기능이 다시 켜졌습니다.
pause