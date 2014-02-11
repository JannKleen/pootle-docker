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


Notes
-----

- By default the django instance (run by CherryPy) is listening on port 8000 with ALLOWED_HOSTS set to '\*'. This means you can *theoretically* expose the docker port to external access, although this is probably not a good idea.
- Pootle computes a lot of stuff when it first starts up, so the first request will take **much** longer than subsequent ones.
- Default admin credentials are 'admin':'admin'

