FROM alpine:latest
MAINTAINER Brady Owens <brady@fastglass.net>

ADD scripts/start-mysqld.sh /start-mysqld.sh
ADD scripts/run.sh /run.sh
RUN chmod 755 /*.sh

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
COPY my.cnf /etc/mysql/my.cnf

# Add volumes for MySql
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

# Expose the port for MySQL
EXPOSE 3306

CMD ["/run.sh"]
