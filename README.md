# Helper for Vagrant Docker provider

- For no linux host machine which needs boot2docker/CoreOS as a host VM, especially Mac.
- Use NFS synced folder instead of rsync.

***Note) But you may prefer Docker provisioner to Docker provider on Mac.***
https://github.com/YungSang/vagrant-docker-helper/tree/master/provisioner

### Boot up a host VM (= `vagrant up`)
```
$ make up
```

### Remake containers (= `vagrant reload`)
```
$ make provision
```

### SSH to a host VM
```
$ make ssh
```

###  Reload a host VM
```
$ make reload
```

### Suspend a host VM
```
$ make suspend
```

### Stop a host VM
```
$ make stop
```

### Destroy containers and a host VM
```
$ make clean
```

### Set DOCKER_HOST to use Docker from a local machine
```
$ export DOCKER_HOST="tcp://`make ssh-config | sed -n "s/[ ]*HostName[ ]*//gp"`:2375"
```
