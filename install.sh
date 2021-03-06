#!/bin/sh
echo "Téléchargement de la configuration docker"
wget https://github.com/oracle/docker-images/archive/master.zip -O master.zip -o log
echo "Extraction"
unzip master.zip >> log

echo "Création de l’image ... Cela peut prendre quelques heures en fonction de la connexion"
 
cd docker-images-master/OracleDatabase/SingleInstance/dockerfiles/
./buildDockerImage.sh -x -v 18.4.0 1>> log
cd ../../../..
pwd

echo "Création de l’image termiée !"
read -p "appuyez sur entrer pour continuer ..."
echo "Configuration de data ... merci d’entrer votre mot de passe quand demandé"
mkdir data
sudo chown -R 54321:54321 data
echo "Installation terminée !"
