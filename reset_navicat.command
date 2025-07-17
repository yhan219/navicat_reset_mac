#!/bin/bash

APP_NAME="Navicat Premium"

cd `dirname $0`
sh reset_navicat.sh

# ---------- 重启 Navicat ----------
echo "正在启动 $APP_NAME..."
if open -a "$APP_NAME"; then
  echo "$APP_NAME 已成功启动，试用期重置完成！"
else
  echo "错误: 无法启动 $APP_NAME，请检查应用程序是否已安装。" >&2
  exit 1
fi