#!/bin/bash

# setup a data container so we have db consistency
docker=`which docker`
$docker run -v /var/pootledb --name POOTLEDB busybox true
