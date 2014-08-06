# Script zum Anlegen einer neuen MySQL-Datenbank/Benutzer mit vollen Rechten
# Author: mikemonoton / computerwerkstatt glocksee hannover
# Datum: 17.06.2014
# Version: 0.1
# Web: https://www.glocksee.org
# Blog: http://blog.glocksee.org

# Datenbankserverdaten 
MYSQLADMIN_USER="root"
MYSQLADMIN_PASSWORD="streng-geheimes-passwort"
MYSQLADMIN_HOST="localhost"
MYSQLHOST="localhost"

# DB-Name, DB-User, DB-Passwort für die DB 
MYSQLDATABASE="$1"
MYSQLUSER="$1"
MYSQLPASSWORD="$2"

# wenn kein Passwort mitgegeben wird, dann erstellt pwgen ein 16-stelliges 
if [ -z "$MYSQLPASSWORD" ]
then
MYSQLPASSWORD="`pwgen 16 1`"
fi

# Benutzung von "newdb" 
if [ $# -lt 1 -o $# -gt 2 ]
then
echo "Usage: $0 dbname [password]"
exit
fi

# in den DB-Server/MySQL Konsole einloggen und DB & User anlegen und Rechte vergeben, DatenOutput
mysql -u$MYSQLADMIN_USER -p$MYSQLADMIN_PASSWORD -h$MYSQLADMIN_HOST mysql << EOF
CREATE DATABASE \`$MYSQLDATABASE\` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON \`$MYSQLDATABASE\`.* TO \`$MYSQLUSER\`@\`$MYSQLHOST\` IDENTIFIED BY "$MYSQLPASSWORD";
EOF
 
echo "MySQL:"
echo "Datenbankname: $MYSQLDATABASE"
echo "Benutzername : $MYSQLUSER"
echo "Passwort : $MYSQLPASSWORD"

exit 0