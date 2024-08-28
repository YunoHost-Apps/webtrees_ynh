<!--
Важно: этот README был автоматически сгенерирован <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Он НЕ ДОЛЖЕН редактироваться вручную.
-->

# Webtrees для YunoHost

[![Уровень интеграции](https://dash.yunohost.org/integration/webtrees.svg)](https://ci-apps.yunohost.org/ci/apps/webtrees/) ![Состояние работы](https://ci-apps.yunohost.org/ci/badges/webtrees.status.svg) ![Состояние сопровождения](https://ci-apps.yunohost.org/ci/badges/webtrees.maintain.svg)

[![Установите Webtrees с YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=webtrees)

*[Прочтите этот README на других языках.](./ALL_README.md)*

> *Этот пакет позволяет Вам установить Webtrees быстро и просто на YunoHost-сервер.*  
> *Если у Вас нет YunoHost, пожалуйста, посмотрите [инструкцию](https://yunohost.org/install), чтобы узнать, как установить его.*

## Обзор

Webtrees allows you to view and edit your genealogy on your website. It has full editing capabilities, full privacy functions, and supports imedia such as photos and document images. As an online program, it fosters extended family participation and good ancestral recording habits, as it simplifies the process of collaborating with others working on your family lines. Your latest information is always on your web site and available for others to see, defined by viewing rules you set.

- It works from standard GEDCOM files, and is therefore compatible with every major desktop application.
- It aims to to be efficient and effective by using the right combination of third-party tools, design techniques and open standards.

**Note:** Its better to upgrade from the Webtrees admin panel when new version arrives.


**Поставляемая версия:** 2.1.20~ynh1

**Демо-версия:** <https://dev.webtrees.net/demo-stable/index.php?route=%2Fdemo-stable%2Ftree%2Fdemo>

## Снимки экрана

![Снимок экрана Webtrees](./doc/screenshots/1200px-Webtrees.png)

## Документация и ресурсы

- Официальный веб-сайт приложения: <https://www.webtrees.net>
- Официальная документация администратора: <https://wiki.webtrees.net>
- Репозиторий кода главной ветки приложения: <https://github.com/fisharebest/webtrees>
- Магазин YunoHost: <https://apps.yunohost.org/app/webtrees>
- Сообщите об ошибке: <https://github.com/YunoHost-Apps/webtrees_ynh/issues>

## Информация для разработчиков

Пришлите Ваш запрос на слияние в [ветку `testing`](https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing).

Чтобы попробовать ветку `testing`, пожалуйста, сделайте что-то вроде этого:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
или
sudo yunohost app upgrade webtrees -u https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
```

**Больше информации о пакетировании приложений:** <https://yunohost.org/packaging_apps>
