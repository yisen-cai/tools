docker stop codelabs && docker rm codelabs
docker run -d -p 8080:80 --name codelabs  qunar/codelabs

docker ps
