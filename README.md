# signal
Run signal desktop in a Debian Docker container

## How To
* Build the container image.
```
docker build -t signal .
```
* Run the image.
```
docker run -it --rm -u 1000:1000 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:$HOME -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -w $HOME --entrypoint /bin/bash signal
```
* Start signal-desktop
```
/opt/Signal/signal-desktop
```
