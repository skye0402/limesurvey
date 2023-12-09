# Use the postgres:16.1-bullseye base image
FROM debian:bullseye

# Install PHP and other necessary packages
RUN apt-get update && \
    apt-get install -y php php-pgsql && \
    apt-get install -y php-gd && \
    apt-get install -y php-intl && \
    apt-get install -y php-simplexml && \
    apt-get install -y php-zip && \
    apt-get install -y php-imap && \
    apt-get -y install php-ldap && \
    apt install -y php-mbstring && \
    apt-get install unzip && \
    rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Prepare limesurvey
COPY limesurvey*.zip /home
RUN mkdir /app/tmp
RUN unzip /home/* -d /app
# RUN mkdir /tmp/tmp
# RUN mkdir /tmp/upload
# RUN mkdir /tmp/config
# RUN cp -r /app/limesurvey/tmp /tmp
# RUN cp -r /app/limesurvey/upload /tmp
# RUN cp -r /app/limesurvey/application/config /tmp
# RUN chmod -R 755 /app/limesurvey/tmp; chown -R $(id -u):$(id -g) /app/limesurvey/tmp
# RUN chmod -R 755 /app/limesurvey/upload; chown -R $(id -u):$(id -g) /app/limesurvey/upload
# RUN chmod -R 755 /app/limesurvey/application/config; chown -R $(id -u):$(id -g) /app/limesurvey/application/config

# Expose the PHP server port (default is 80)
EXPOSE 80