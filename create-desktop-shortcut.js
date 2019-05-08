var Shell = new ActiveXObject('WScript.shell');

var desktopPath = Shell.SpecialFolders('Desktop');
var shortcut = Shell.CreateShortcut(desktopPath + '\\Encryption.lnk');
shortcut.IconLocation = Shell.ExpandEnvironmentStrings('%InstallDir%\\img\\gnupg.ico');
shortcut.TargetPath = Shell.ExpandEnvironmentStrings('%InstallDir%\\main.hta');
shortcut.Save();
