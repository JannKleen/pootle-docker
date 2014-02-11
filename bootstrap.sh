#!/bin/bash

# setup a data container so we have db consistency
/usr/bin/docker run -v /var/pootledb -name POOTLEDB busybox true
