## Solution choisie
Pour ces travaux nous avons choisi de créer une application web, en effet les interfaces graphiques sont très simples a gérer et d'un point de vue comptatibilité et déploiement les solutions webs ont leurs avantages ...

Familiés avec PHP orienté objet et le développement web, nous avons choisi un assortiment d'outils de développement afin de s'exempter des tâches les plus pénibles et chronophages compte tenu des délais très courts. C'est pourquoi nous utilisons Laravel, qui fonctionne sur une architecture 'pseudo' MVC, il est très souple et l'ORM fournie (Eloquent) avec est simple à utiliser.

## Installation de l'application

### Prérequis
* PHP fonctionnant en ligne de commande
* Composer
* Serveur Apache/MySQL/PHP
* Git

Récupérer le projet via l'archive dans le dépôt moodle ou cloner le projet avec git. Se placer dans le répertoire de l'application via ligne de commande et lancer la commande *composer* pour mettre à jour les dépendances.

```
git clone git@gitlab.com:Graouuuu17/ProjetBDD.git
```

``` 
composer update
```` 

Créer un fichier de configuration pour Laravel :

```
cp .env.example .env
```

Et fournir les informations suivantes :

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=
DB_USERNAME=
DB_PASSWORD=
```

Configurer le framework Laravel

```
php artisan key:generate
```

Et enfin il faut configurer le serveur web pour que la racine du site web pointe sur le dossier `public/`. 

## Outils utilisés

* Versionning : GIT avec le projet héberger sur gitlab.com
* Plateforme de développement (Apache/MySQL/PHP: WampServer)
* Composer : Gestionnaire de dépendances PHP
* Framework Backend (PHP) : Laravel
* Framework Frontend (HTML/CSS/JS) : Bootstrap

