# navicat16 mac版无限重置试用期脚本

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

## 免责声明

**本脚本为免费使用，本脚本只供个人学习使用，使用需严格遵守开源许可协议。严禁用于商业用途，禁止进行任何盈利活动。对一切非法使用所产生的后果，概不负责！**

## 脚本声明

- **本脚本适用于mac系统，不适用于windows**
- **如果遇到bug问题，请反馈issue给我**

## 使用说明

- 从 [navicat premium](https://www.navicat.com.cn/download/navicat-premium) 官网下载最新版。安装并运行，选择试用14天。
- 待试用到期后，运行重置脚本。`./reset_navicat.sh`

## 原理说明

- 删除`~/Library/Preferences/com.navicat.NavicatPremium.plis`文件中`key`值为`91F6C435D172C8163E0689D3DAD3F3E9`和`B966DBD409B87EF577C9BBF3363E9614`
  对应的数据
  如图（按空格键可以预览）
  ![](image/img1.png)
- 删除`~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat\ CC/Navicat\ Premium/`目录下的`.`开头的隐藏文件
  如图
  ![](image/img.png)

## 为什么不生效

有用户反馈使用后不生效，请按照以下步骤检查

- 仅支持中文版，英文版可以参考原理说明中自己写一个脚本
- 退出navicat后再运行脚本
- 重启Mac再执行脚本
- 按照原理说明查看对应的数据是否删除成功

## 许可证

![](https://gitee.com/yhan219/blog-image/raw/master/yhan/LGPL.svg)