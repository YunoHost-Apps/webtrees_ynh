<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Webtrees YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/webtrees.svg)](https://ci-apps.yunohost.org/ci/apps/webtrees/) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/webtrees.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/webtrees.maintain.svg)

[![Instalatu Webtrees YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=webtrees)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Webtrees YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

Webtrees allows you to view and edit your genealogy on your website. It has full editing capabilities, full privacy functions, and supports imedia such as photos and document images. As an online program, it fosters extended family participation and good ancestral recording habits, as it simplifies the process of collaborating with others working on your family lines. Your latest information is always on your web site and available for others to see, defined by viewing rules you set.

- It works from standard GEDCOM files, and is therefore compatible with every major desktop application.
- It aims to to be efficient and effective by using the right combination of third-party tools, design techniques and open standards.

**Note:** Its better to upgrade from the Webtrees admin panel when new version arrives.


**Paketatutako bertsioa:** 2.1.20~ynh1

**Demoa:** <https://dev.webtrees.net/demo-stable/index.php?route=%2Fdemo-stable%2Ftree%2Fdemo>

## Pantaila-argazkiak

![Webtrees(r)en pantaila-argazkia](./doc/screenshots/1200px-Webtrees.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://www.webtrees.net>
- Administratzaileen dokumentazio ofiziala: <https://wiki.webtrees.net>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/fisharebest/webtrees>
- YunoHost Denda: <https://apps.yunohost.org/app/webtrees>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/webtrees_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
edo
sudo yunohost app upgrade webtrees -u https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
