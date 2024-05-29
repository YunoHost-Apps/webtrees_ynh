<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 Webtrees

[![集成程度](https://dash.yunohost.org/integration/webtrees.svg)](https://dash.yunohost.org/appci/app/webtrees) ![工作状态](https://ci-apps.yunohost.org/ci/badges/webtrees.status.svg) ![维护状态](https://ci-apps.yunohost.org/ci/badges/webtrees.maintain.svg)

[![使用 YunoHost 安装 Webtrees](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=webtrees)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 Webtrees。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

Webtrees allows you to view and edit your genealogy on your website. It has full editing capabilities, full privacy functions, and supports imedia such as photos and document images. As an online program, it fosters extended family participation and good ancestral recording habits, as it simplifies the process of collaborating with others working on your family lines. Your latest information is always on your web site and available for others to see, defined by viewing rules you set.

- It works from standard GEDCOM files, and is therefore compatible with every major desktop application.
- It aims to to be efficient and effective by using the right combination of third-party tools, design techniques and open standards.

**Note:** Its better to upgrade from the Webtrees admin panel when new version arrives.


**分发版本：** 2.1.18~ynh2

**演示：** <https://dev.webtrees.net/demo-stable/index.php?route=%2Fdemo-stable%2Ftree%2Fdemo>

## 截图

![Webtrees 的截图](./doc/screenshots/1200px-Webtrees.png)

## 文档与资源

- 官方应用网站： <https://www.webtrees.net>
- 官方管理文档： <https://wiki.webtrees.net>
- 上游应用代码库： <https://github.com/fisharebest/webtrees>
- YunoHost 商店： <https://apps.yunohost.org/app/webtrees>
- 报告 bug： <https://github.com/YunoHost-Apps/webtrees_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
或
sudo yunohost app upgrade webtrees -u https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
