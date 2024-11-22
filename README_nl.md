<!--
NB: Deze README is automatisch gegenereerd door <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Hij mag NIET handmatig aangepast worden.
-->

# Webtrees voor Yunohost

[![Integratieniveau](https://dash.yunohost.org/integration/webtrees.svg)](https://ci-apps.yunohost.org/ci/apps/webtrees/) ![Mate van functioneren](https://ci-apps.yunohost.org/ci/badges/webtrees.status.svg) ![Onderhoudsstatus](https://ci-apps.yunohost.org/ci/badges/webtrees.maintain.svg)

[![Webtrees met Yunohost installeren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=webtrees)

*[Deze README in een andere taal lezen.](./ALL_README.md)*

> *Met dit pakket kun je Webtrees snel en eenvoudig op een YunoHost-server installeren.*  
> *Als je nog geen YunoHost hebt, lees dan [de installatiehandleiding](https://yunohost.org/install), om te zien hoe je 'm installeert.*

## Overzicht

Webtrees allows you to view and edit your genealogy on your website. It has full editing capabilities, full privacy functions, and supports imedia such as photos and document images. As an online program, it fosters extended family participation and good ancestral recording habits, as it simplifies the process of collaborating with others working on your family lines. Your latest information is always on your web site and available for others to see, defined by viewing rules you set.

- It works from standard GEDCOM files, and is therefore compatible with every major desktop application.
- It aims to to be efficient and effective by using the right combination of third-party tools, design techniques and open standards.

**Note:** Its better to upgrade from the Webtrees admin panel when new version arrives.


**Geleverde versie:** 2.1.21~ynh1

**Demo:** <https://dev.webtrees.net/demo-stable/index.php?route=%2Fdemo-stable%2Ftree%2Fdemo>

## Schermafdrukken

![Schermafdrukken van Webtrees](./doc/screenshots/1200px-Webtrees.png)

## Documentatie en bronnen

- Officiele website van de app: <https://www.webtrees.net>
- Officiele beheerdersdocumentatie: <https://wiki.webtrees.net>
- Upstream app codedepot: <https://github.com/fisharebest/webtrees>
- YunoHost-store: <https://apps.yunohost.org/app/webtrees>
- Meld een bug: <https://github.com/YunoHost-Apps/webtrees_ynh/issues>

## Ontwikkelaarsinformatie

Stuur je pull request alsjeblieft naar de [`testing`-branch](https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing).

Om de `testing`-branch uit te proberen, ga als volgt te werk:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
of
sudo yunohost app upgrade webtrees -u https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
```

**Verdere informatie over app-packaging:** <https://yunohost.org/packaging_apps>
