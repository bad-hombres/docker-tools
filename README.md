# Docker Tools

Set of functions / scripts for easilly creating binstubs for docker images

```
  ./install.sh /path/to/file
```

File is a pipe separated file containing the image name, docker run command
options and the name of the binary to crate (optional, see defaults.txt)

The file parameter is also optional

There is also a create\_binstub script which takes upto 3 arguments (look in the
install.sh

The Dockerfiles dir is where I will be creating docker images for tools I want
to dockerize

## Bin stubs

The bin stubs are generated from a temoplate and have the following options
(ising the example for the gowapt image(. 

- Run command
```
$ gowapt
```
- Stop the container
```
$ gowapt stop
```

- Update the container
```
$ gowapt update
```
- Change the options passed to the docker command
```
$ OPTS="--rm -ti -p 3000:3000" gowapt 
```
- Pass extra arguments to the docker command
```
$ EXTRA_OPTS="-v /usr/share/wordlists:/tmp/wordlists" gowapt
```
The above would mount and additional folder
- Mount your $HOME dir inside the container
```
$ MOUNT\_HOME\_DIR=true gowapt
```
The above command mounts you home dir inside the container (in the same
location)
