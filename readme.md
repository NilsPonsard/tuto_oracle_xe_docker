# installation d’oracle XE 18c sur linux grâce à docker 

## Prérequis : 
- une connaissance de base de linux et le shell
- un accès root via sudo 

## Étape 1 : installation de docker & docker-compose
Veuillez vous réferer à la documentation de votre distribution pour installer `docker` et `docker-compose`  
Sur arch linux et ses dérivés faire : 
```
$ sudo pacman -Syu docker docker-compose
$ sudo gpasswd -a $USER docker
```
Puis redemmarez votre machine pour mettre à jour les groupes

## Étape 2 : création de l’image docker 
- Télécharger l’archive (zip) ce repo : [https://github.com/oracle/docker-images](https://github.com/oracle/docker-images)
- Extraire l’archive et se placer dans le répertoire `OracleDatabase/SingleInstance/dockerfiles`
- Lancer le script avec les paramètres `./buildDockerImage.sh -x -v 18.4.0`
- Attendre que le scrip finisse, le script télécharge oracle xe après avoir affiché  
```
Complete!
Loaded plugins: ovl
```
Il faut être patient
- normalement le script se termine avec un 
```
  Oracle Database Docker Image for 'xe' version 18.4.0 is ready to be extended: 
    
    --> oracle/database:18.4.0-xe

  Build completed in 1352 seconds.
```

## Étape 3 : dossier de sauvegarde
Pour sauvegarder l’état de la base de données même après avoir arrêté le conteneur il faut créer un dossier nommé data appartenant à l’utilisateur `oracle`. 



## Étape 4 : docker-compose 
Docker compose est un outil permettant de plus facilement lancer des images docker.
