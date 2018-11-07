# signal
Run Signal Desktop in a Debian Docker container

## How To (Basic)

User your parent workstation's home directory for Signal Desktop's persistent data.  Your entire home directory will be mounted in the container.

* Build the container image.

```
docker build -t signal .
```

* Run the image.

```
docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME:/home/signal \
  signal
```

## How To (Optional Advanced)

Create a Docker volume for persistent data.  Your workstation's home directory will not be mounted in the container.

* Build the container image.

```
docker build -t signal .
```

* Build a volume to house your persistent data.

```
docker volume create signal
```

* Inspect new volume to find the path to the volume's data directory.

```
docker volume inspect signal | grep Mount
```

This will return `"Mountpoint": "/path/to/docker/volumes/signal/_data",`

* Set user and group permissions on the data directory to match your primary user and group on the parent workstation.  Use the path to the volume's data directory found above.

```
sudo chown -R [your_user]:[your_group] /path/to/docker/volumes/signal/_data
```

* Run the image.

```
docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --mount type=volume,source=signal,destination=/home/signal/.config/Signal \
  signal
```
