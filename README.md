# navicat16/17 mac版无限重置试用期脚本

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->


[![码云Gitee](https://gitee.com/yhan219/navicat_reset_mac/badge/star.svg?theme=blue)](https://gitee.com/yhan219/navicat_reset_mac)
[![GitHub](https://img.shields.io/github/stars/yhan219/navicat_reset_mac.svg?style=social&label=Stars)](https://github.com/yhan219/navicat_reset_mac)
![License](https://img.shields.io/badge/License-LGPL-blue.svg)


## 免责声明

**本脚本为免费使用，本脚本只供个人学习使用，使用需严格遵守开源许可协议。严禁用于商业用途，禁止进行任何盈利活动。对一切非法使用所产生的后果，概不负责！**

## 脚本声明

- **本脚本适用于mac系统，不适用于windows**
- **如果遇到bug问题，请反馈issue给我**

## 使用说明

- 从 [navicat premium](https://www.navicat.com.cn/download/navicat-premium) 官网下载最新版。安装并运行，选择试用14天。
- 待试用到期后，运行重置脚本。`./reset_navicat.sh`

## 注意事项
- 使用前请备份数据。依次点击`文件-导出链接-全选-导出密码`导出并备份所有数据。
- 已支持最新版。~~如遇高版本不生效的，可尝试16.2版本。~~[点击从官网下载](https://download.navicat.com/download/navicat162_premium_cs.dmg)

## 原理说明

- 删除`~/Library/Preferences/com.navicat.NavicatPremium.plis`文件中`key`值为`91F6C435D172C8163E0689D3DAD3F3E9`和`B966DBD409B87EF577C9BBF3363E9614`
  对应的数据
  如图（按空格键可以预览）
  ![](image/img1.png)
- 删除`~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat\ CC/Navicat\ Premium/`目录下的`.`开头的隐藏文件
  如图
  ![](image/img.png)
- 高版本删除`~/Library/Preferences/com.navicat.NavicatPremium.plis`文件中`key`值为`014BF4EC24C114BEF46E1587042B3619`对应的数据


## 为什么不生效

有用户反馈使用后不生效，请按照以下步骤检查

- 仅支持中文版，英文版可以参考原理说明中自己写一个脚本
- 退出navicat后再运行脚本
- 重启Mac再执行脚本
- 按照原理说明查看对应的数据是否删除成功

## 尝试其他人的脚本
- 可尝试`reset_navicat_52pojie.sh`脚本，由[52破解](https://www.52pojie.cn/forum.php?mod=viewthread&tid=1669993)
提供,原理是一样的，感谢[@Dr-Octopus-dev](https://github.com/yhan219/navicat_reset_mac/issues/16)提供。**侵删**。
- 尝试`reset_navicat_new.sh`,感谢[pretend-m](https://github.com/pretend-m/navicat_for_mac_reset)

## 许可证

![](image/LGPL.svg)

<picture>
  <source
    media="(prefers-color-scheme: dark)"
    srcset="
      https://api.star-history.com/svg?repos=yhan219/navicat_reset_mac&type=Date&theme=dark
    "
  />
  <source
    media="(prefers-color-scheme: light)"
    srcset="
      https://api.star-history.com/svg?repos=yhan219/navicat_reset_mac&type=Date
    "
  />
  <img
    alt="Star History Chart"
    src="https://api.star-history.com/svg?repos=yhan219/navicat_reset_mac&type=Date"
  />
</picture>
