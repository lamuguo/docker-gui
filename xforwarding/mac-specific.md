#### x-forwarding with Docker-for-mac

1. Run XQuartz

  a. Update preferences 'Security' tab - turn on 'Allow connection from network clients'
  b. Restart XQuartz and then check to see that it is listening on port 6000:
     ```
     lsof -i :6000
     ```

2. Get your local machine's IP:

  ```
  ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}') && echo "My IP is: $ip"
  ```

3. Allow the local machine to talk to XQuartz

  ```
  xhost + ${ip}
  ```

4. Run your docker host:

  ```
  docker run -d --name firefox -e DISPLAY=${ip}:0 -v /tmp/.X11-unix:/tmp/.X11-unix jess/firefox
  ```
