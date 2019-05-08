@echo off

call %~dp0context.cmd

:: Set %DocumentsDirFilename% to %DocumentsDir% filename
call :filename "%DocumentsDir%"
set DocumentsDirFilename=%filename%

:: Set %DocumentsDirFilename% to %DocumentsDirDirname% filename
call :dirname "%DocumentsDir%"
set DocumentsDirDirname=%dirname%

if not exist "%WorkDir%" ( mkdir "%WorkDir%" )
if not exist "%BackupDir%" ( mkdir "%BackupDir%" )

if exist "%LockFile%" (
    exit /b 1
) else (
    echo %UserName% >"%LockFile%"
)

del /f /q "%ErrorLevelFile%" 2>nul

if exist "%DocumentsDir%" (
    call %~dp0gpg-enc.cmd
) else (
    call %~dp0gpg-dec.cmd
)

echo %errorlevel% >"%ErrorLevelFile%"
del "%LockFile%"

exit /b %errorlevel%

:dirname
for /F "delims=" %%i in (%*) do set dirname=%%~dpi
exit /b 0

:filename
for /F "delims=" %%i in (%*) do set filename=%%~nxi
exit /b 0

:basename
for /F "delims=" %%i in (%*) do set basename=%%~ni
exit /b 0
