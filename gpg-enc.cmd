@echo off

if exist "%EncrypedArchive%" ( move /y "%EncrypedArchive%" "%EncrypedArchiveBackup%" )
if not exist "%DocumentsDir%" ( goto :no-doc-dir )

move "%DocumentsDir%" "%WorkDir%" || goto :cannot-move-doc-dir

7z a "%TempArchive%" "%WorkDir%\%DocumentsDirFilename%" -aoa || goto :7z-add-fail
gpg --batch --yes -z 0 -r "%Recipient%" -o "%EncrypedArchive%" -e "%TempArchive%" || goto :gpg-encrypt-fail

rmdir /s /q "%WorkDir%"
set errorlevel=0
goto :exit

:no-doc-dir
set errorlevel=2
goto :exit

:cannot-move-doc-dir
set errorlevel=3
goto :exit

:7z-add-fail
move "%WorkDir%\%DocumentsDirFilename%" "%DocumentsDirDirname%"
set errorlevel=4
goto :exit

:gpg-encrypt-fail
move "%WorkDir%\%DocumentsDirFilename%" "%DocumentsDirDirname%"
set errorlevel=5
goto :exit

:exit
exit /b %errorlevel%
