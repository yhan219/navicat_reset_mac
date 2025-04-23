#!/bin/bash
#/usr/libexec/PlistBuddy -c "print" ~/Library/Preferences/com.navicat.NavicatPremium.plist
/usr/libexec/PlistBuddy -c "Delete :014BF4EC24C114BEF46E1587042B3619" ~/Library/Preferences/com.navicat.NavicatPremium.plist
/usr/libexec/PlistBuddy -c "Delete :91F6C435D172C8163E0689D3DAD3F3E9" ~/Library/Preferences/com.navicat.NavicatPremium.plist
/usr/libexec/PlistBuddy -c "Delete :B966DBD409B87EF577C9BBF3363E9614" ~/Library/Preferences/com.navicat.NavicatPremium.plist

rm -rf ~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat\ CC/Navicat\ Premium/.*