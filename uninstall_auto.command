#!/bin/bash

PLIST_NAME="com.github.yhan219.navicatreset"
PLIST_PATH="$HOME/Library/LaunchAgents/$PLIST_NAME.plist"

if [ -f "$PLIST_PATH" ]; then
    echo "正在卸载定时任务...（Uninstalling scheduled task...）"
    launchctl unload "$PLIST_PATH" 2>/dev/null
    rm "$PLIST_PATH"
    echo "卸载完成。Uninstall complete."
else
    echo "未检测到定时任务。No scheduled task found."
fi
