Pootle Docker Container
=======================

This is the source for **jannkleen/pootle** in the docker index.

Installation
------------

- The easy way:

    ```
    docker pull jannkleen/pootle
    ```

- The other way:

    ```
    git clone https://github.com/JannKleen/pootle-docker.git

    cd pootle-docker

    docker build .
    ```


Running Pootle
--------------

You probably want to set up a persistant database so you don't loose all your data and settings every time your container is restarted. This is done using Data Volume Containers (http://docs.docker.io/en/latest/use/working_with_volumes/)

There is a simple bootstrap script which creates the Volume Container for you, just run:

```
/usr/bin/wget -O - https://raw.github.com/JannKleen/pootle-docker/master/bootstrap.sh | sh -s -
```

After that you should start your pootle instance by running:

```
docker run -volumes-from POOTLEDB jannkleen/pootle
```


Notes
-----

- By default the django instance (run by CherryPy) is listening on port 8000 with ALLOWED_HOSTS set to '\*'. This means you can *theoretically* expose the docker port to external access, although this is probably not a good idea.
- Pootle computes a lot of stuff when it first starts up, so the first request will take **much** longer than subsequent ones.
- Default admin credentials are 'admin':'admin'

