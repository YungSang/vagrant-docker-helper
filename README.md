# Helper for Vagrant Docker provider

- For no linux host machine which needs boot2docker VM, especially Mac.
- Use NFS synced folder for boot2docker VM instead of rsync.
- Map the current local directory onto `/vagrant` in a container through `/vagrant` in boot2docker VM

### Boot up boot2docker VM (= `vagrant up`)
```
$ make up
```

### Remake a container (= `vagrant reload`)
```
$ make provision
```

### SSH to boot2docker VM
```
$ make ssh
```

###  Reload boot2docker VM
```
$ make reload
```

### Suspend boot2docker VM
```
$ make suspend
```

### Stop boot2docker VM
```
$ make stop
```

### Destroy boot2docker VM
```
$ make clean
```

### Set DOCKER_HOST to use Docker from a local machine
```
$ export DOCKER_HOST="tcp://`make ssh-config | sed -n "s/[ ]*HostName[ ]*//gp"`:4243"
```
