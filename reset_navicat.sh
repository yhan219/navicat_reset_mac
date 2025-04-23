#!/bin/bash
set -uo pipefail  # 启用严格错误处理

# ---------- 定义变量 ----------
APP_NAME="Navicat Premium"
APP_SUPPORT_DIR="$HOME/Library/Application Support/PremiumSoft CyberTech/Navicat CC/Navicat Premium"
PLIST_FILE="$HOME/Library/Preferences/com.navicat.NavicatPremium.plist"

# ---------- 终止 Navicat 进程 ----------
echo "正在终止 $APP_NAME 进程..."
if pkill -9 "$APP_NAME" 2>/dev/null; then
  echo "已成功终止正在运行的 $APP_NAME 进程。"
else
  echo "$APP_NAME 进程未在运行，跳过终止。"
fi

# ---------- 清理应用支持目录的哈希文件 ----------
echo "清理应用支持目录的哈希文件..."
hash_files=()
while IFS= read -r -d $'\0' file; do
  hash_files+=("$file")
done < <(find "$APP_SUPPORT_DIR" -maxdepth 1 -type f -name ".[0-9A-Fa-f][0-9A-Fa-f]*" -print0)

if [[ ${#hash_files[@]} -gt 0 ]]; then
  for file in "${hash_files[@]}"; do
    filename=$(basename "$file")
    if [[ $filename =~ ^\.[0-9A-Fa-f]{32}$ ]]; then
      echo "删除哈希文件: $filename"
      rm -f "$file"
    fi
  done
else
  echo "未找到需要清理的哈希文件。"
fi

# ---------- 处理偏好设置文件 ----------
echo "处理偏好设置文件..."
if [[ -f "$PLIST_FILE" ]]; then
  # 获取所有符合32位哈希格式的顶级键
  keys_to_delete=$(/usr/libexec/PlistBuddy -c "Print" "$PLIST_FILE" | grep -Eoa "^\s{4}[0-9A-F]{32}" | tr -d ' ')
  if [[ -n "$keys_to_delete" ]]; then
    while IFS= read -r key; do
      echo "正在删除密钥: $key"
      /usr/libexec/PlistBuddy -c "Delete :$key" "$PLIST_FILE" 2>/dev/null || true
    done <<< "$keys_to_delete"
  else
    echo "未找到需要删除的32位哈希密钥。"
  fi
else
  echo "偏好设置文件不存在: $PLIST_FILE"
fi

# ---------- 重启 Navicat ----------
echo "正在启动 $APP_NAME..."
if open -a "$APP_NAME"; then
  echo "$APP_NAME 已成功启动，试用期重置完成！"
else
  echo "错误: 无法启动 $APP_NAME，请检查应用程序是否已安装。" >&2
  exit 1
fi