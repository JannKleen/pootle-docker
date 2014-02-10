FROM ubuntu:13.10
MAINTAINER Jann Kleen "jann@resmio.com"
RUN apt-get -qq update
RUN apt-get install -y python-dev python-setuptools git build-essential libxml2-dev libxslt-dev libxml2 libxslt1.1 zlib1g-dev
RUN easy_install pip
RUN pip install virtualenv
RUN virtualenv /var/www/pootle/env
RUN /var/www/pootle/env/bin/pip install Pootle
RUN /var/www/pootle/env/bin/pip install django-tastypie==0.9.16
RUN /var/www/pootle/env/bin/pootle init
RUN /var/www/pootle/env/bin/pootle setup
RUN /var/www/pootle/env/bin/pootle collectstatic --noinput
RUN /var/www/pootle/env/bin/pootle assets build
RUN grep -q '^POOTLE_ENABLE_API' file && sed -i "s/\(POOTLE_ENABLE_API *= *\).*/\1True/" ~/.pootle/pootle.conf || echo "\nPOOTLE_ENABLE_API = True\n" >> ~/.pootle/pootle.conf
ADD run.sh /usr/local/bin/run
EXPOSE 8000
CMD /usr/local/bin/run

