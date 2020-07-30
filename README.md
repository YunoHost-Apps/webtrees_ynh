# Webtrees for YunoHost
[![Integration level](https://dash.yunohost.org/integration/webtrees.svg)](https://dash.yunohost.org/appci/app/webtrees)  
[![Install Webtrees with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=webtrees)

> *This package allow you to install Webtrees quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

**VERY IMPORTANT: There is a security fix in nginx. Please update as soon as possible regarless of any version you are on.**

## Overview

webtrees is the web's leading online collaborative genealogy application.

-It works from standard GEDCOM files, and is therefore compatible with every major desktop application.
-It aims to to be efficient and effective by using the right combination of third-party tools, design techniques and open standards.

webtrees allows you to view and edit your genealogy on your website. It has full editing capabilities, full privacy functions, and supports imedia such as photos and document images. As an online program, it fosters extended family participation and good ancestral recording habits, as it simplifies the process of collaborating with others working on your family lines. Your latest information is always on your web site and available for others to see, defined by viewing rules you set.

**Note:** Its better to upgrade from the Webtrees admin panel when new version arrives. <br><br>

**Shipped version:** 2.0.7, released **27 July 2020**

## Demo

* [Official demo](https://dev.webtrees.net/demo-dev/index.php?ctype=gedcom&ged=demo)
## Documentation

 * Official documentation: https://wiki.webtrees.net

## YunoHost specific features

#### Multi-users support

No LDAP configuration is there for Webtrees yet.<br>
Multi-instance: **yes**

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/webtrees%20%28Community%29.svg)](https://ci-apps.yunohost.org/ci/apps/webtrees/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/webtrees%20%28Community%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/webtrees/)

## Links

 * Report a bug: https://github.com/YunoHost-Apps/webtrees_ynh/issues
 * App website: https://www.webtrees.net
 * Git repository: https://github.com/fisharebest/webtrees
 * YunoHost website: https://yunohost.org/

---

Developers info
----------------

**Only if you want to use a testing branch for coding, instead of merging directly into master.**
Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
or
sudo yunohost app upgrade webtrees -u https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
```
