#!/bin/bash

RESET_SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)/reset_navicat.sh"
PLIST_NAME="com.github.yhan219.navicatreset"
PLIST_PATH="$HOME/Library/LaunchAgents/$PLIST_NAME.plist"
LOG_FILE="$HOME/Library/Logs/navicat_reset.log"

# 删除已有定时任务（如存在）
if launchctl list | grep -q "$PLIST_NAME"; then
    echo "🧹 Removing existing launch agent... 正在删除已有的定时任务..."
    launchctl unload "$PLIST_PATH" >/dev/null 2>&1
fi

if [ -f "$PLIST_PATH" ]; then
    rm "$PLIST_PATH"
    echo "🧹 Removed old plist file: $PLIST_PATH"
fi

# 检查是否是 uninstall 模式
if [[ "$1" == "uninstall" ]]; then
    echo "✅ Uninstalled navicat auto-reset task."
    echo "✅ 已卸载 Navicat 自动重置任务。"
    exit 0
fi

# 写入新的 plist 文件
cat > "$PLIST_PATH" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" \
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$PLIST_NAME</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>$RESET_SCRIPT_PATH</string>
    </array>
    <key>StartInterval</key>
    <integer>$((13*24*60*60))</integer>
    <key>RunAtLoad</key>
    <true/>
    <key>StandardOutPath</key>
    <string>$LOG_FILE</string>
    <key>StandardErrorPath</key>
    <string>$LOG_FILE</string>
</dict>
</plist>
EOF

# 加载新的定时任务
launchctl load "$PLIST_PATH"

# 执行一次脚本
echo "🚀 Running navicat reset now... 正在立即执行 Navicat 重置..."
/bin/bash "$RESET_SCRIPT_PATH"

echo "✅ Navicat reset completed and auto-reset task installed every 13 days."
echo "✅ Navicat 重置完成，已安装每13天自动重置任务。"
