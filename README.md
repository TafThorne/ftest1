# ftest1
Dockerfile that sets up a basic Debian production environment with a number of libraries configured, fdev1 adds development tools to it

The Docker Image is listed on Docker Hub:
https://hub.docker.com/r/tafthorne/ftest1/

To pull the image:

 docker pull tafthorne/ftest1

An overview of the included libraries is given below.

## Using This Image
The expected way to use this image is to navigate to the working directory
where your executable resides and start an interactive session.

  docker run -ti --volume="${PWD}:/shared" -w "/shared" tafthorne/ftest1

Then within the running container you can the executable as if it were a
native tool.  The libraries added to this image will be in the global include
environment. 

## CppUTest

CppUTest is a unit testing and mocking framework for C/C++.  For further
details please see their project page.
* http://cpputest.github.io/

## spdlog

spdlog is a fast, header only C++ logging library.  For further details please
see their project page.
* https://github.com/gabime/spdlog

## Contributing

Please see the notes in CONTRIBUTING.md.

