#!/bin/bash

# 定义要查找的目录
directories=("/private" "$HOME")

# 遍历目录
for dir in "${directories[@]}"; do
    echo "正在查找目录: $dir"

    # 使用 find 命令查找文件
    # -type f: 只查找文件
    # -iname "*navicat*": 文件名包含 "navicat"（不区分大小写）
    # ! -name "*.ncx": 排除 .ncx 结尾的文件
    # ! -name "*.sh": 排除 .sh 结尾的文件
    # ! -path "*reset*": 排除路径中包含 "reset" 的文件或文件夹
    # -print0: 以 null 字符分隔结果，避免文件名中的空格问题
    find "$dir" -type f -iname "*navicat*" ! -name "*.ncx" ! -name "*.sh" ! -path "*reset*" -print0 | while IFS= read -r -d '' file; do
        echo "删除文件: $file"
        rm -f "$file"
    done

    echo "查找完成: $dir"
done

echo "所有操作完成"