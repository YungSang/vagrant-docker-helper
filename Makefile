VAGRANT_DEFAULT_PROVIDER ?= virtualbox

up:
	VAGRANT_DEFAULT_PROVIDER="${VAGRANT_DEFAULT_PROVIDER}" vagrant up --provider docker

provision:
	vagrant reload

ssh:
	cd docker-host; vagrant ssh

# export DOCKER_HOST="tcp://`make ssh-config | sed -n "s/[ ]*HostName[ ]*//gp"`:2375"
ssh-config:
	cd docker-host; vagrant ssh-config

reload:
	cd docker-host; vagrant reload

suspend:
	cd docker-host; vagrant suspend

stop:
	cd docker-host; vagrant halt

destroy:
	vagrant destroy -f

clean: destroy
	cd docker-host; vagrant destroy -f
