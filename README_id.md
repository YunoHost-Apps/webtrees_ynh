<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# Webtrees untuk YunoHost

[![Tingkat integrasi](https://dash.yunohost.org/integration/webtrees.svg)](https://ci-apps.yunohost.org/ci/apps/webtrees/) ![Status kerja](https://ci-apps.yunohost.org/ci/badges/webtrees.status.svg) ![Status pemeliharaan](https://ci-apps.yunohost.org/ci/badges/webtrees.maintain.svg)

[![Pasang Webtrees dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=webtrees)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang Webtrees secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

Webtrees allows you to view and edit your genealogy on your website. It has full editing capabilities, full privacy functions, and supports imedia such as photos and document images. As an online program, it fosters extended family participation and good ancestral recording habits, as it simplifies the process of collaborating with others working on your family lines. Your latest information is always on your web site and available for others to see, defined by viewing rules you set.

- It works from standard GEDCOM files, and is therefore compatible with every major desktop application.
- It aims to to be efficient and effective by using the right combination of third-party tools, design techniques and open standards.

**Note:** Its better to upgrade from the Webtrees admin panel when new version arrives.


**Versi terkirim:** 2.1.20~ynh1

**Demo:** <https://dev.webtrees.net/demo-stable/index.php?route=%2Fdemo-stable%2Ftree%2Fdemo>

## Tangkapan Layar

![Tangkapan Layar pada Webtrees](./doc/screenshots/1200px-Webtrees.png)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://www.webtrees.net>
- Dokumentasi admin resmi: <https://wiki.webtrees.net>
- Depot kode aplikasi hulu: <https://github.com/fisharebest/webtrees>
- Gudang YunoHost: <https://apps.yunohost.org/app/webtrees>
- Laporkan bug: <https://github.com/YunoHost-Apps/webtrees_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
atau
sudo yunohost app upgrade webtrees -u https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
