@echo off
:: GnuPG recipient
set Recipient=GnuPG@recipient.here
:: Path to directory to encrypt
set DocumentsDir=%UserProfile%\Desktop\Encrypt me
:: Path to encrypted archive
set EncrypedArchive=%UserProfile%\Desktop\encrypted.tar.gpg
:: Program install path
set InstallDir=%AllUsersProfile%\gpg-batch
:: main.cmd will use this lockfile
set LockFile=%InstallDir%\lockfile
:: main.cmd will write here errorlevel
set ErrorLevelFile=%InstallDir%\errorlevel
:: Work directory, all temporary data will be here
set WorkDir=%InstallDir%\temp
:: 7z output
set TempArchive=%WorkDir%\documents-archive.tar
:: Directory that holds security backups
set BackupDir=%InstallDir%\backup
:: Instead of overwrite encryped archive
:: we move the last .tar.gpg file here
set EncrypedArchiveBackup=%BackupDir%\last.tar.gpg

if [%1] neq [] ( call echo %%%1%% )
