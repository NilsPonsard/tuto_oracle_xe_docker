# installation d’oracle XE 18c sur linux grâce à docker 

## Prérequis : 
- une connaissance de base de linux et le shell
- un accès root via sudo 
- avoir `wget` et `unzip` d’installé sur la machine

## Étape 1 : installation de docker & docker-compose
Veuillez vous réferer à la documentation de votre distribution pour installer `docker` et `docker-compose`  
### Arch linux et ses dérivés : 
```
$ sudo pacman -Syu docker docker-compose
$ sudo gpasswd -a $USER docker
$ sudo systemctl enable docker
```
### Debian / Ubuntu : 
```
$ sudo apt update 
$ sudo apt upgrade
$ sudo apt install docker docker-compose
$ sudo gpasswd -a $USER docker
$ sudo systemctl enable docker
```
Puis redémmarez votre machine pour mettre à jour les groupes et que le service docker se lance 

## Étape 2 : création de l’image docker 
Lancer le script `install.sh` qui va créer sur votre machine une image docker avec oracle xe et va configurer le dossier pour oracle xe.  
Le script peut prendre de 30 minutes à quelques heures en fonction de votre connexion internet.

## Étape 3 : premier lancement 
Utiliser le script `run.sh` pour lancer la base de donée, le premier lancement fera la configuration de la base de données qui prendra quelques minutes, pour voir l’avancement, utilisez `docker-compose logs bd-xe`.  
Si vous voyez dans les logs : 
```
bd-xe_1  | #########################
bd-xe_1  | DATABASE IS READY TO USE!
bd-xe_1  | #########################
```
Vous pouvez passer à l’étape suivante 


## Étape 4 : connexion via sqldeveloper 
Dans sqldeveloper : 
- Créez une nouvelle connexion avec toute les options par défaut sauf : 
    - name : BD
    - Nom d’utilsateur : SYSTEM
    - Mot de passe : passsword 
- Cliquez sur le bouton Connexion
- normalement vous pouvez maintenant lancer les scripts et suivre les cours :)

## Commandes à utiliser
- pour démarrer : `./run.sh`
- pour arrêter la base de données : `./stop.sh`