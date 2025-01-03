<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Webtrees pour YunoHost

[![Niveau d’intégration](https://apps.yunohost.org/badge/integration/webtrees)](https://ci-apps.yunohost.org/ci/apps/webtrees/)
![Statut du fonctionnement](https://apps.yunohost.org/badge/state/webtrees)
![Statut de maintenance](https://apps.yunohost.org/badge/maintained/webtrees)

[![Installer Webtrees avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=webtrees)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Webtrees rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

Webtrees vous permet de visualiser et de modifier votre généalogie sur votre site Web. Il dispose de capacités d'édition complètes, de fonctions de confidentialité complètes et prend en charge les imedia tels que les photos et les images de documents. En tant que programme en ligne, il favorise la participation de la famille élargie et les bonnes habitudes d'enregistrement ancestrales, car il simplifie le processus de collaboration avec d'autres personnes travaillant sur vos lignées familiales. Vos dernières informations sont toujours sur votre site Web et accessibles aux autres, définies par les règles d'affichage que vous avez définies.

- Il fonctionne à partir de fichiers GEDCOM standard et est donc compatible avec toutes les principales applications de bureau.
- Il vise à être efficient et efficace en utilisant la bonne combinaison d'outils tiers, de techniques de conception et de normes ouvertes.

**Remarque :** Il est préférable de mettre à niveau à partir du panneau d'administration Webtrees lorsqu'une nouvelle version arrive.

**Version incluse :** 2.2.1~ynh1

**Démo :** <https://dev.webtrees.net/demo-stable/index.php?route=%2Fdemo-stable%2Ftree%2Fdemo>

## Captures d’écran

![Capture d’écran de Webtrees](./doc/screenshots/1200px-Webtrees.png)

## Documentations et ressources

- Site officiel de l’app : <https://www.webtrees.net>
- Documentation officielle de l’admin : <https://wiki.webtrees.net>
- Dépôt de code officiel de l’app : <https://github.com/fisharebest/webtrees>
- YunoHost Store : <https://apps.yunohost.org/app/webtrees>
- Signaler un bug : <https://github.com/YunoHost-Apps/webtrees_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
ou
sudo yunohost app upgrade webtrees -u https://github.com/YunoHost-Apps/webtrees_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
