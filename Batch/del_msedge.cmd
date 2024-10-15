:: NOTE this might not work for everybody, I'm uploading
::      it here to uninstall MSEdge from my other PC

@echo off
:: Uninstall Microsoft Edge
cd /d "%PROGRAMFILES(X86)%\Microsoft\Edge\Application"
for /f "tokens=*" %%f in ('dir /b /ad') do (
    cd "%%f\Installer"
    setup.exe --uninstall --system-level --verbose-logging --force-uninstall
    cd ..\..
)

:: Apply registry tweak to prevent Edge from reinstalling
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft" /v "EdgeUpdate" /t REG_SZ /d "" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d 1 /f

if %errorlevel%==1 (
    echo Errors occured during uninstallation
) else (
    echo Microsoft Edge uninstalled successfully
)
pause