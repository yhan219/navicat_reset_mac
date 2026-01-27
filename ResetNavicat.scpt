property btnTitle : "试用"

set resourcesPath to (path to me as string) & "Contents:Resources:"
set shPath to POSIX path of (resourcesPath & "reset_navicat.sh")

try
    do shell script "sh " & quoted form of shPath
end try

tell application "/Applications/Navicat Premium.app" to activate

tell application "System Events"
    tell application process "Navicat Premium"
        click button btnTitle of window 1
        delay 1
    end tell
end tell