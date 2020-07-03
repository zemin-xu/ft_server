
sudo docker stop ft_server 
sudo docker system prune
sudo docker rmi $(docker images -a -q)

sudo docker build -t ft_server .
sudo docker run -it -p 80:80 -p 443:443 ft_servers