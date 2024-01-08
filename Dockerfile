# Use the debian:bullseye base image
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


# Expose the PHP server port (default is 80)
EXPOSE 80