import sys
import shutil

userPrefsName = 'userPrefs'
windowPrefsName = 'windowPrefs'
backupSuffix = '_backupByCaptureSettings'
captureSuffix = '_captureSettings'
ext = '.mel'

userPrefsPath = userPrefsName + ext
windowPrefsPath = windowPrefsName + ext
backupUserPrefsPath = userPrefsName + backupSuffix + ext
backupWindowPrefsPath = windowPrefsName + backupSuffix + ext
captureUserPrefsPath = userPrefsName + captureSuffix + ext
captureWindowPrefsPath = windowPrefsName + captureSuffix + ext


def setCaptureSettings():
    shutil.copyfile(userPrefsPath, backupUserPrefsPath)
    shutil.copyfile(windowPrefsPath, backupWindowPrefsPath)
    shutil.copyfile(captureUserPrefsPath, userPrefsPath)
    shutil.copyfile(captureWindowPrefsPath, windowPrefsPath)

def restoreNormalSettings():
    shutil.copyfile(backupUserPrefsPath, userPrefsPath)
    shutil.copyfile(backupWindowPrefsPath, windowPrefsPath)

def main():
    setCaptureSettings()

if __name__ == '__main__':
    main()
    

