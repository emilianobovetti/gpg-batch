set BackupDir=gpg-backup

if not exist "%BackupDir%" ( mkdir "%BackupDir%" )

gpg -a --export >"%BackupDir%\pubkeys.asc"
gpg -a --export-secret-keys >"%BackupDir%\privatekeys.asc"
gpg --export-ownertrust >"%BackupDir%\ownertrust.txt"
