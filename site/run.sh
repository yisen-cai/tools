docker stop codelabs && docker rm codelabs
docker run -d -p 8000:80 --name codelabs  qunar/codelabs
docker ps

echo "Codelabs running in http://localhost:8000 ~"
