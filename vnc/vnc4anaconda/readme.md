## Docker image with Anaconda + Visual Studio Code + VNC

1. `./build.sh`
2. `./run.sh`
3. Inside the container:
  `vnc4server :0`, choose password
4. On host connect on ```localhost:5900``` with a vnc client, for instance _VNC viewer for Google Chrome_ or _Remmina remote desktop client_
5. In container:
  ```bash
  su user
  code
  ```
  or
  ```bash
  code --user-data-dir=/tmp
  ```

### problem
this not working, but chromium works
