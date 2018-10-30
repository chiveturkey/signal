# signal
Run signal desktop in an Ubuntu Docker container

## How To
1. Build the container image.
```
docker build -t signal .
```
1. Run the image.
```
docker run -it --rm -u 1000:1000 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:$HOME -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -w $HOME --entrypoint /bin/bash signal
```
1. Start signal-desktop
```
/opt/Signal/signal-desktop
```
