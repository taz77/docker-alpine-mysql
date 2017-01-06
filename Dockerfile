FROM alpine:latest
MAINTAINER Brady Owens <brady@fastglass.net>

ADD scripts/start-mysqld.sh /start-mysqld.sh
ADD scripts/run.sh /run.sh

# Add MySQL utils
ADD scripts/create-mysql-users.sh /create-mysql-users.sh
RUN chmod 755 /*.sh && apk add --update mysql mysql-client && rm -f /var/cache/apk/*

# Add volumes for MySql
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

# Expose the port for MySQL
EXPOSE 3306

CMD ["/run.sh"]
