#!/bin/bash

cd /var/www/pootle/env/
source bin/activate

python bin/pootle run_cherrypy --host 0.0.0.0 --port 8000

