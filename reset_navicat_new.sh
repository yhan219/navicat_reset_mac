# copy from https://github.com/pretend-m/navicat_for_mac_reset

rm -rf ~/Library/Preferences/com.navicat.NavicatPremium.plist

regex="\.([0-9A-Z]{32})"
[[ $(ls -a ~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat\ CC/Navicat\ Premium/ | grep '^\.') =~ $regex ]]

hash=${BASH_REMATCH[1]}

if [ ! -z $hash ]; then
    rm ~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat\ CC/Navicat\ Premium/.$hash
fi
