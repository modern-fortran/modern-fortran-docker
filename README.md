# modern-fortran-docker

Dockerfile to build a modern-fortran Docker image.
It's based off Ubuntu 18.04 and installs gfortran, OpenMPI, and OpenCoarrays for you.
It will also git clone the modern-fortran projects.

You will need Docker set up and running on your system.

## Build

```
docker build . -t modern-fortran:latest
```

If the build is successful, you'll be able to see your new image, for example:

```
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
modern-fortran      latest              0e5c745c8928        6 minutes ago       546MB
```

## Run

```
docker run -it modern-fortran:latest /bin/bash
```

## Thanks

Maurizio Tomassi who provided the original Dockerfile.
