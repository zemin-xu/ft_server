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
