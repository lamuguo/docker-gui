## Run x2go with XFCE in docker

### In host machine:
$ docker run -d --name x2go -p 2222:22 x2go

### In client machine:
$ x2goclient --ssh-port=2222

Then, create a session with user "test" / password "test123", make sure you are using "XFCE", then you can get a new desktop.

### TODO
+ Run it remotely
+ Run i3wm.
+ Install software required for developing.
+ A lot of others...


### Comments
Based on this, we can get a remote developing environment, and the setup can be shared in a team, which can be helpful for new-engineers to join the team.
