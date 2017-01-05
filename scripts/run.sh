#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

# Make sure permissions are flexible for the container to host relationship.
chmod -R 770 /var/lib/mysql
chmod -R 770 /var/run/mysqld

rm /var/run/mysqld/mysqld.sock

# If there is no mysql folder then we do setup.
if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."

    # Try the 'preferred' solution
    mysqld --initialize-insecure > /dev/null 2>&1

    # IF that didn't work
    if [ $? -ne 0 ]; then
        # Fall back to the 'depreciated' solution
        mysql_install_db > /dev/null 2>&1
    fi

    echo "=> Done!"
    # Setup user accounts.  
    /create_mysql_users.sh
else
    echo "=> Using an existing volume of MySQL"
fi