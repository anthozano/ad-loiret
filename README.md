# AD Orléans

## Solution choisie

Pour ces travaux nous avons choisi de créer une application web, en effet les interfaces graphiques sont très simples a gérer grâce a html et d'un point de vue comptatibilité et déploiement les solutions webs ont leurs avantages ...

Familiés avec PHP orienté objet et le développement web, nous avons choisi un assortiment d'outils de développement afin de s'exempter des tâches les plus pénibles et chronophages compte tenu des délais très courts. C'est pourquoi nous utilisons le framework php Laravel, qui fonctionne sur une architecture 'pseudo' MVC, il est très souple et l'ORM fournie (Eloquent) avec est simple à utiliser.

## Installation de l'application

### Prérequis
* PHP fonctionnant en ligne de commande
* Composer
* Serveur Apache/MySQL/PHP
* Git

Récupérer le projet avec git. Ensuite, une fois le projet récupérer, se placer dans le répertoire de l'application via ligne de commande et lancer la commande *composer* pour mettre à jour les dépendances, cette commande peut être longue.

```
git clone git@gitlab.com:Graouuuu17/ProjetBDD.git
```

``` 
composer update
```

## Configurer le framework **Laravel**

Créer un fichier de configuration pour Laravel depuis le fichier `.example` : 

```
cp .env.example .env
```

Et fournir les informations correctes aux lignes suivantes :

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=dbname
DB_USERNAME=dbuser
DB_PASSWORD=dbpswd
```

Générer une clef pour l'application avec la commande `artisan`

```
$ php artisan key:generate
```

## Configurer le serveur web (**apache**)

Et enfin il faut configurer le serveur web pour que la racine du site web pointe sur le dossier `public/` ou travaillez directement depuis ce dossier. Pour cela vous pouvez créer un alias vers le dossier `public` de l'application.

## Créer la base de données

Dans le dossier `export/` se trouve différents fichier :
* `Database.php` : Classe servant à communiquer avec la base de donnée
* `Config.php` : Classe servant à obtenir la configuration pour se connecter à la base de données
* `Exporter.php` : Classe servant à exporter les données du fichier csv vers la base de données
* `conf.php` : Fichier où se trouvent les paramètres de connexion à la base de données
* `run.php` : Fichier servant à lancer l'export
* `db.create_table.sql` : Fichier sql créant la base de données ainsi que ses tables 

Pour installer la base de données, vérifier les paramétres de connexion à la base de données se trouvant dans `export/conf.php`. Ensuite se placer dans le dossier `export/` et exécuter la commande suivante (attention, cette commande est très longue a exécuté) :

```
php run.php
```

## Base de données

### Base retenue

Voici un diagramme représantant la base de données que nous avons conçus :
![]("http://anthozano.fr/report/db/ad/diagram.png")

Nous avons parfois volontairement choisi des types de données très généraux, puisque les données elles même sont très nombreuse et structuré de façon hétérogénes.
De cette façon, lorsqu'aucune logique particulière n'est détectée, nous pouvons stocké malgré tout les données en préservant leurs intégrétés.

Sur certaines données, par exemple la taille, on ne retrouve qu'une demi-douzaine de valeurs différente, multiplier par le nombre de ligne (environ 30k), cela fait beaucoup de doublon ! Lorque cela arrive, nous enregistrons uniquement des valeurs différentes, ce qui explique la relation `n - m` entre photo et taille. Une photo peut avoir plusieurs tailles (car plusieurs clichés) et une taille peut connaitre plusieurs photos, puisqu'on ajoute pas de taille si c'est un doublon.
Pour cela, nous utilisons la contrainte `UNIQUE` sur la colonne en question et lors de l'insertion, nous utilisons l'instruction `INSERT IGNORE INTO`, qui ne fera rien si le tuple à inserer existe déjà.

### Déroulement du passage fichier (`csv`) -> relationnel (`MySQL`)

* Création de la base de données
* Découpage du fichier csv en un tableau
* Pour chaque ligne du tableau
    * Pour chaque colonne de la ligne 
        * Enregistrement de la colonne
            * Préparation de la donnée (formatage)
            * Sauvegarde de la donnée dans sa table correspondante
            * Si la donnée est une clef étrangère dans une autre table
                * Enregistrement de l'`id` de la donnée dans le programme
            * Si la donnée a une clef étrangère
                * Recupération de la clef étrangère correspondante depuis le programme

## Outils utilisés

* Versionning : GIT avec le projet héberger sur gitlab.com
* Plateforme de développement (Apache/MySQL/PHP: WampServer/MAMP)
* Composer : Gestionnaire de dépendances PHP
* Framework Backend (PHP) : Laravel
* Framework Frontend (HTML/CSS/JS) : Bootstrap
* Microsoft Excel (pour apréhender le fichier `csv` source)

## Choix des données

* Date
    * Nous avons choisi de stoker la date en utilisant une colonne a part entière pour le jour, le mois et l'année. En effet parfois on connait la date exacte (jour/mois/année) mais d'autre fois on n'a que l'année ou le mois et l'année. Ce qui nous a pousser a stocker la date de cette façon, qui est plutôt archaïque.
    * De ce fait, nous auront des dates qui ressembleront à `date(NULL, NULL, 1961)` ou `date(19, 02, 1992)` ou bien encore `date(NULL, 02, 1989)`.
    * L'année est extraite de la chaine de caractère grâce a l'expression régulière suivante : `[\d]{4}`
    * Le mois est extrait de la chaine de caractère grâce a une expression regulière qui recherche une correspondance avec les mois de l'année grâce a une boucle.
    * Le jour est extrait de la chaine de caractère grâce a l'expression régulière suivante : `[\d]{1,2} `
    * Parfois, on retrouve plusieurs dates différentes dans la même ligne, sans que cela ait un sens apparent. La dernière date est alors choisi.
* Taille
    * Nous avons choisi d'ignorer la taille donnée en pouce, celle ci toujours préciser entre parenthèse, nous l'avons éliminer grâce à l'expression régulière suivante : `\([^\)]+\)`
    * Ensuite, la taille donnée en centimetre est extraite grâce à l'expression regulière suivante : `[\d]*(?(?=,),5)x[\d]*(?(?=,),5*)`