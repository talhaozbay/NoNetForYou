@echo off
echo [!] Wi-fi, Ethernet ve Bluetooth servisleri kapatiliyor...

:: Kayıt defteri değeri değiştiriliyor
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WlanSvc" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHPORT" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHUSB" /v Start /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTAGService" /v Start /t REG_DWORD /d 4 /f

IF %ERRORLEVEL% EQU 0 (
    echo [+] Basariyla guncellendi.
) ELSE (
    echo [X] Hata olustu! Yonetici olarak calistirdiginizdan emin olun.
    pause
    exit /b
)

:: Yeniden başlatma sorusu
CHOICE /M "Bilgisayar yeniden baslatilsin mi?"

IF ERRORLEVEL 2 (
    echo [!] Yeniden baslatma iptal edildi.
) ELSE (
    echo [>] Bilgisayar yeniden baslatiliyor...
    shutdown /r /t 5
)

pause
