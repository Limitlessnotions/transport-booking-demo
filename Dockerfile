FROM wordpress:latest

RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install SQLite integration plugin
ADD https://downloads.wordpress.org/plugin/sqlite-database-integration.zip /tmp/sqlite.zip
RUN unzip /tmp/sqlite.zip -d /var/www/html/wp-content/plugins \
    && rm /tmp/sqlite.zip

# Enable SQLite drop-in
RUN cp /var/www/html/wp-content/plugins/sqlite-database-integration/db.php \
       /var/www/html/wp-content/db.php

COPY wp-config.php /var/www/html/wp-config.php

