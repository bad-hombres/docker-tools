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

