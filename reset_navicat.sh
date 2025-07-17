#!/bin/bash
set -uo pipefail  # 启用严格错误处理 / Enable strict error handling

# ---------- 定义变量 / Define variables ----------
APP_NAME="Navicat Premium"
APP_SUPPORT_DIR="$HOME/Library/Application Support/PremiumSoft CyberTech/Navicat CC/Navicat Premium"
PLIST_FILE="$HOME/Library/Preferences/com.navicat.NavicatPremium.plist"

# ---------- 终止 Navicat 进程 / Terminate Navicat process ----------
echo "正在终止 $APP_NAME 进程... / Terminating $APP_NAME process..."
if pkill -9 "$APP_NAME" 2>/dev/null; then
  echo "已成功终止正在运行的 $APP_NAME 进程。/ Successfully terminated running $APP_NAME process."
else
  echo "$APP_NAME 进程未在运行，跳过终止。/ $APP_NAME process not running, skipping termination."
fi

# ---------- 清理应用支持目录的哈希文件 / Cleaning hash files in app support directory ----------
echo "清理应用支持目录的哈希文件... / Cleaning hash files in app support directory..."
find "$APP_SUPPORT_DIR" -maxdepth 1 -type f -name '.[0-9A-F][0-9A-F]*' 2>/dev/null | \
while IFS= read -r file; do
  filename=$(basename "$file")
  # 基础正则表达式匹配 32 位哈希 / Basic regex to match 32-character hash
  if echo "$filename" | grep -Eq '^\.([0-9A-F]{32})$'; then
    echo "删除哈希文件: $filename / Deleting hash file: $filename"
    rm -f "$file"
  fi
done

# ---------- 处理偏好设置文件 / Handling preferences plist file ----------
echo "处理偏好设置文件... / Processing preferences plist file..."
if [[ -f "$PLIST_FILE" ]]; then
  # 获取所有符合32位哈希格式的顶级键 / Get all top-level keys matching 32-character hash
  keys_to_delete=$(/usr/libexec/PlistBuddy -c "Print" "$PLIST_FILE" | grep -Eoa "^\s{4}[0-9A-F]{32}" | tr -d ' ')
  if [[ -n "$keys_to_delete" ]]; then
    while IFS= read -r key; do
      echo "正在删除密钥: $key / Deleting key: $key"
      /usr/libexec/PlistBuddy -c "Delete :$key" "$PLIST_FILE" 2>/dev/null || true
    done <<< "$keys_to_delete"
  else
    echo "未找到需要删除的32位哈希密钥。/ No 32-character hash keys found to delete."
  fi
else
  echo "偏好设置文件不存在: $PLIST_FILE / Preferences plist file not found: $PLIST_FILE"
fi
