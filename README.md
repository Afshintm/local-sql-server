This is a sql server docker compose and docker file folder structure.

to run it locally after cloning the repo:

1- docker-compose build --no-cache

2- docker-compose up -d


to remove the container:

docker-compose down

There is a folder called mnt/mssql which includes local data and log files.

The folder get mounted in the compose file so that you do not loose any data of your sql server database you work with.
