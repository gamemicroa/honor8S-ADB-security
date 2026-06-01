@echo off
title Browser Switch: Chrome -> Firefox
echo ==============================
echo   Switching default browser
echo ==============================
echo.

echo [1/3] Installing Firefox...
curl -L -o Firefox.apk "https://download.mozilla.org/?product=firefox-latest-ssl&os=android&lang=en-US"
adb install -r Firefox.apk

echo.
echo [2/3] Disabling Chrome (safe user-level remove)
adb shell pm uninstall --user 0 com.android.chrome

echo.
echo [3/3] Setting Firefox as default (best effort)
adb shell cmd package set-home-activity org.mozilla.firefox/.App

echo.
echo DONE ✔
echo If links still open Chrome:
echo -> Go Settings > Apps > Default Apps > Browser
pause