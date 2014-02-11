#!/bin/bash

# Point the database location to a shared container
sed -i "s/\('NAME' *: *\).*/\1'\/var\/pootledb\/pootle.db',/" ~/.pootle/pootle.conf

# If the shared container doesn't contain the database yet, copy the initial database from /var/local/pootledb
if [ ! -e "/var/pootledb/pootle.db" ]; then
    if [ -e "/var/local/pootledb/pootle.db" ]; then
        echo "Copying local database to shared container ..."
        cp /var/local/pootledb/pootle.db /var/pootledb
    else
        echo "ERROR: Database can't be set up, you should run pootle setup!"
        exit 1
    fi
fi

cd /var/www/pootle/env/
source bin/activate

python bin/pootle run_cherrypy --host 0.0.0.0 --port 8000

