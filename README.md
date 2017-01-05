# Alpine Based MySQL Container

This is a permanent fork of https://github.com/wangxian/alpine-mysql

Use this container to build a production like MySQL server in a small container. A persistant container
can be created using volumes to hold the MySQL configuration and database records.


# To Build Image
```
docker build -t fastglass/alpine-mysql .
```

# Build Arguments

If you want to create a database and user, in your build statement specify the following variables

```
$CREATE_MYSQL_BASIC_USER_AND_DB=1
$MYSQL_USER_NAME="somename"
$MYSQL_USER_DB="somedbname"
$MYSQL_USER_PASS="somepassword"
```

# Usage
```
docker run -it --name mysql -p 3306:3306 -v $(pwd):/app -e MYSQL_DATABASE=admin -e MYSQL_USER=tony -e MYSQL_PASSWORD=dpa\*12d -e MYSQL_ROOT_PASSWORD=111111 fastglass/alpine-mysql
```
