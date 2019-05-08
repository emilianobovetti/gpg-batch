@echo off

if not exist "%EncrypedArchive%" ( goto :no-encryped-archive )

gpg -o "%TempArchive%" -d "%EncrypedArchive%" || goto :gpg-decrypt-fail
7z x "%TempArchive%" -o"%WorkDir%" || goto :7z-extract-fail
move "%WorkDir%\%DocumentsDirFilename%" "%DocumentsDirDirname%" || goto :cannot-move-doc-dir

gpgconf --reload gpg-agent

rmdir /s /q "%WorkDir%"
set errorlevel=0
goto :exit

:cannot-move-doc-dir
set errorlevel=3
goto :exit

:no-encryped-archive
set errorlevel=6
goto :exit

:gpg-decrypt-fail
set errorlevel=7
goto :exit

:7z-extract-fail
set errorlevel=8
goto :exit

:exit
exit /b %errorlevel%
