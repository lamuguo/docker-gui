# Docker UI

https://hub.docker.com/r/uifd/ui-for-docker/

Pour l’instancier depuis Docker CLI :

```
docker run -d \
  -p 9000:9000 \
  --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock
  uifd/ui-for-docker
```

# RStudio

https://hub.docker.com/r/rocker/rstudio/

```
sudo docker run -d -p 8787:8787 rocker/rstudio
```

see: http://dirk.eddelbuettel.com/papers/useR2015_docker.pdf

# Python Visual Studio Code
```
cd ./vscode
docker build -t test-vscode .
xhost +

docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --name="vscode" test-vscode bash
```

dans le container:
```
adduser toto
su toto
/usr/local/VSCode-linux-x64/Code

Gtk-Message: Failed to load module "canberra-gtk-module"
libGL error: failed to open drm device: No such file or directory
libGL error: failed to load driver: i965
bash: cannot set terminal process group (-1):
Inappropriate ioctl for device
bash: no job control in this shell
```
you should have a Code window in the host GUI.



#### Xforwarding problems

- http://stackoverflow.com/questions/24095968/docker-for-gui-based-environments
- http://www.troubleshooters.com/linux/docker/docker_newbie.htm
