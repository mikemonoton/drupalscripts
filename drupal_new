#!/bin/bash

# Script zum ANlegen einer neuen Drupal 7 Installationen
# Author: mikemonoton
# Datum: 17.06.2014
# Version: 0.1


# Drupalversion
version=$1

# prüft ob das programm mit den richtigen argumenten ausgeführt wird
test $# -ne 1 && echo "usage: $0 <version>" && exit 1

# blabla
echo "!!! Willkommen zur Drupal Installation !!!"
echo "in 3 Sekunden gehts los"

# Sekunden warten
sleep 3

echo "Drupal-${version} downloaden und entpacken, Verzeichnisse kopieren"
# Sekunden warten
sleep 2

# aktuelle Drupal Version von Drupalcenter downloaden
wget http://www.drupalcenter.de/files/drupal-${version}-DE.tar.gz

# Drupal tgz entpacken
tar xfz drupal-${version}-DE.tar.gz

# in das Verzeichnis drupal-XYZ-DE wechseln
cd drupal-${version}-DE

# alle Dateien in das uebergordnete Verzeichniss kopieren
mv * .gitignore .htaccess ../

# geht zurueck in den DocumentRoot
cd ..

echo "nicht benötigte Dateien und Verzeichnisse loeschen"
# Sekunden warten
sleep 2

# entpacktes Drupal verzeichnis, *tar.gz, und alle *.txt Dateien loeschen, ausser: robots.txt
rm -r drupal-${version}-DE/
rm -r drupal-${version}-DE.tar.gz
rm CHANGELOG.txt COPYRIGHT.txt INSTALL.mysql.txt INSTALL.pgsql.txt INSTALL.sqlite.txt INSTALL.txt LICENSE.txt MAINTAINERS.txt README.txt UPGRADE.txt

echo "in den Ordner sites/default gehen und settings.php und files anlegen"
# Sekunden warten
sleep 2

cd sites/default
cp default.settings.php settings.php
mkdir files

echo "Rechte für die Installation für files und settings.php anpassen"
# Sekunden warten
sleep 2

# Rechte anpassen
chmod 777 files
chmod 777 settings.php

echo "zurück ins DocumentRoot"
# zurück ins DocumentRoot
cd ../../

echo "!!! Drupal ist nun bereit für die Installation via Webbrowser !!!"

# Sekunden warten
sleep 2

exit 0
