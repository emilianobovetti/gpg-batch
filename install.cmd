@echo off

call %~dp0context.cmd

where /q choco

if errorlevel 1 (
    "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    set "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

choco install gpg4win-vanilla -y
choco install 7zip.portable -y

if not exist "%InstallDir%" ( mkdir "%InstallDir%" )

copy %~dp0main.hta "%InstallDir%"
copy %~dp0main.cmd "%InstallDir%"
copy %~dp0context.cmd "%InstallDir%"
copy %~dp0gpg-enc.cmd "%InstallDir%"
copy %~dp0gpg-dec.cmd "%InstallDir%"
xcopy /i /s /y %~dp0img "%InstallDir%\img"
xcopy /i /s /y %~dp0css "%InstallDir%\css"
xcopy /i /s /y %~dp0grampa-js "%InstallDir%\grampa-js"

CScript create-desktop-shortcut.js
