# ft_server

## docker command

### run container
docker image pull debian:buster

ex: docker run --name test -it debian

docker container run [OPTIONS] IMAGE [COMMAND] [ARG...]
//run a command in a new container
-i : keep STDIN open even if not attached
-t : allocate a pseudo-TTY

docker stop [OPTIONS] CONTAINER [CONTAINER...]
ex: docker stop my_container
// delete all
docker system prune

docker start test
docker exec -it test bash

// build image from dockerfile
docker build -t ft_server .

// run container from this image
docker run -it -p 80:80 -p 443:443 ft_server

### tutorial LEMP
https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10
