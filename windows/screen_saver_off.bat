@echo off
:: 화면 보호기 사용 안 함 설정 (0: 해제, 1: 설정)
reg add "HKCU\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 0 /f

:: 변경된 레지스트리 설정을 시스템에 즉시 적용
rundll32.exe user32.dll, UpdatePerUserSystemParameters

echo 화면 보호기 작동이 중지되었습니다.
pause