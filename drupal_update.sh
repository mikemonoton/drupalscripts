#!/bin/bash

# Script zum updaten bestehender Drupal 7 Installationen
# Author: mikemonoton / computerwerkstatt glocksee hannover
# Datum: 04.01.2013
# Version: 0.1
# Web: https://www.glocksee.org
# Blog: http://blog.glocksee.org


# Drupalversion
version=$1

# prüft ob das programm mit den richtigen Argumenten ausgeführt wird, wenn nicht zeigt wie es geht und bricht ab
test $# -ne 1 && echo "usage: $0 <version>" && exit 1

# blabla
echo "Willkommen zum Drupal Update"
echo "Seite wird in den Wartzungsmodus gesetzt"

# Sekunden warten
sleep 3

# Webseite in den Wartungsmodus setzen, dazu muss die "drush" (apt-get install drush) auf dem Server installiert sein
drush vset --yes maintenance_mode 1

echo "Webseite im Wartungsmodus"
# Sekunden warten
sleep 2

echo "alle bestehnden Dateien und Verzeichnisse loeschen, ausser den "sites" Ordner"
# Sekunden warten
sleep 2

# alle bestehnden Dateien und Verzeichnisse loeschen, ausser den "sites" Ordner
rm -r authorize.php cron.php .gitignore .htaccess includes index.php install.php misc modules profiles robots.txt scripts themes update.php web.config xmlrpc.php

echo "Drupal-${version} downloaden und entpacken"
# Sekunden warten
sleep 2

# aktuelle Drupal Version von Drupalcenter downloaden
wget http://www.drupalcenter.de/files/drupal-${version}-DE.tar.gz

# Drupal tgz entpacken
tar xvfz drupal-${version}-DE.tar.gz

# in das Verzeichnis drupal-XYZ-DE wechseln
cd drupal-${version}-DE/

# sites Ordner im entpackten Drupal verzeichnis loeschen
rm -r sites

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

echo "Rechte anpassen"
# Sekunden warten
sleep 2

# Rechte anpassen
chmod 755 sites/default
chmod 755 sites/default/settings.php

echo "Webseite aus dem Wartungsmodus nehmen und online stellen"

# Webseite online stellen
drush vset --yes maintenance_mode 0

# Sekunden warten
sleep 2

echo "Webseite ist online"
echo "Update beendet"

# Sekunden warten
sleep 2

exit 0