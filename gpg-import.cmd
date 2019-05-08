set BackupDir=gpg-backup

gpg --import "%BackupDir%\privatekeys.asc"
gpg --import "%BackupDir%\pubkeys.asc"
gpg --import-ownertrust "%BackupDir%\ownertrust.txt"

gpg -K
gpg -k
