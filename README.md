# navicat16/17 mac版无限重置试用期脚本

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

[English](README_en.md)

[![GitHub](https://img.shields.io/github/stars/yhan219/navicat_reset_mac.svg?style=social&label=Stars)](https://github.com/yhan219/navicat_reset_mac)
![License](https://img.shields.io/badge/License-LGPL-blue.svg)


## 免责声明

**本脚本为免费使用，本脚本只供个人学习使用，使用需严格遵守开源许可协议。严禁用于商业用途，禁止进行任何盈利活动。对一切非法使用所产生的后果，概不负责！**

## 脚本声明

- **本脚本适用于mac系统，不适用于windows**
- **如果遇到bug问题，请反馈issue给我**

## 使用说明
- 从 [navicat premium](https://www.navicat.com.cn/download/navicat-premium) 官网下载最新版。安装并运行，选择试用14天。
- 待试用到期后，运行重置脚本。双击`reset_navicat.command`或执行`./reset_navicat.sh`
- 可使用自动重置功能，双击`auto_reset_navicat.command`即可。请注意，如果脚本位置发生改变，需要重新运行。如需卸载，请双击`uninstall_auto.command`

## 注意事项
- 使用前请备份数据。依次点击`文件-导出链接-全选-导出密码`导出并备份所有数据。
- 支持最新版。
- 支持英文版。

## 原理说明

- 删除`~/Library/Preferences/com.navicat.NavicatPremium.plist`文件中`key`值符合32位哈希格式的顶级键的数据，例如中文版的：`91F6C435D172C8163E0689D3DAD3F3E9`、`B966DBD409B87EF577C9BBF3363E9614`和`014BF4EC24C114BEF46E1587042B3619`
  如图（按空格键可以预览）
  ![](image/img1.png)
- 删除`~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat\ CC/Navicat\ Premium/`目录下的`.`开头的隐藏文件
  如图
  ![](image/img.png)
- 删除钥匙串(Keychain)中`com.navicat.NavicatPremium`服务下符合32位哈希格式的试用期追踪条目（不会删除用户保存的数据库连接密码）
- 原理较简单，可参考[reset_navicat_old.sh](reset_navicat_old.sh)

## 为什么不生效

有用户反馈使用后不生效，请按照以下步骤检查

- 完全卸载后再重装，参考[此步骤](#完全卸载再重装)
- 退出navicat后再运行脚本
- 重启Mac再执行脚本
- 按照原理说明查看对应的数据是否删除成功

## 完全卸载再重装
- 重要!!!卸载前备份数据。依次点击`文件-导出链接-全选-导出密码`导出并备份所有数据。
- 卸载navicat（可选）。
- 执行卸载命令`sudo sh delete_navicat.sh`,输入密码后静候片刻。
- 从官网下载最新版安装，安装成功后导入备份数据，待过期后执行重置脚本。

## 鸣谢
本项目持续在更新迭代优化，感谢以下人的贡献
- 完全卸载感谢[Mitsuha](https://github.com/yhan219/navicat_reset_mac/issues/31)提供的思路和PR。
- 英文版和优化版感谢[take7yo](https://github.com/yhan219/navicat_reset_mac/issues/34)提供的思路和脚本。
- 17.3.7以上版本版感谢Minidoracat的PR https://github.com/yhan219/navicat_reset_mac/pull/48


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
