#!/bin/bash
set -uo pipefail

# 获取脚本所在目录的绝对路径
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESET_SCRIPT_NAME="reset_navicat.sh"
RESET_SCRIPT_PATH="$SCRIPT_DIR/$RESET_SCRIPT_NAME"
PLIST_NAME="com.navicat.reset.plist"
PLIST_DEST="$HOME/Library/LaunchAgents/$PLIST_NAME"

# 检查 reset_navicat.sh 是否存在
if [[ ! -f "$RESET_SCRIPT_PATH" ]]; then
    echo "错误: 找不到 $RESET_SCRIPT_NAME 脚本"
    echo "请确保 $RESET_SCRIPT_NAME 与此安装脚本在同一目录下"
    exit 1
fi

# 给 reset_navicat.sh 添加执行权限
chmod +x "$RESET_SCRIPT_PATH"

# 创建 LaunchAgents 目录（如果不存在）
mkdir -p "$HOME/Library/LaunchAgents"

# 生成 plist 文件内容
cat > "$PLIST_DEST" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.navicat.reset</string>

    <key>ProgramArguments</key>
    <array>
        <string>$RESET_SCRIPT_PATH</string>
    </array>

    <key>RunAtLoad</key>
    <true/>

    <key>StartInterval</key>
    <integer>86400</integer>

    <key>StandardOutPath</key>
    <string>$HOME/Library/Logs/com.navicat.reset.log</string>

    <key>StandardErrorPath</key>
    <string>$HOME/Library/Logs/com.navicat.reset.error.log</string>
</dict>
</plist>
EOF

echo "已创建 plist 文件: $PLIST_DEST"

# 卸载旧的配置（如果存在）
launchctl list | grep -q "com.navicat.reset" && launchctl unload "$PLIST_DEST" 2>/dev/null

# 加载新的配置
if launchctl load "$PLIST_DEST"; then
    echo "✅ Launch Agent 已成功加载！"
    echo ""
    echo "配置信息："
    echo "- 脚本路径: $RESET_SCRIPT_PATH"
    echo "- 日志文件: $HOME/Library/Logs/com.navicat.reset.log"
    echo "- 错误日志: $HOME/Library/Logs/com.navicat.reset.error.log"
    echo ""
    echo "管理命令："
    echo "- 查看状态: launchctl list | grep navicat"
    echo "- 手动启动: launchctl start com.navicat.reset"
    echo "- 手动停止: launchctl stop com.navicat.reset"
    echo "- 卸载配置: launchctl unload $PLIST_DEST"
else
    echo "❌ 加载 Launch Agent 失败！"
    exit 1
fi
