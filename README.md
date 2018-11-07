# signal
Run signal desktop in a Debian Docker container

## How To
* Build the container image.
```
docker build -t signal .
```
* Run the image.
```
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix signal
```
* Start signal-desktop
```
/opt/Signal/signal-desktop
```
