FROM yandex/clickhouse-server:latest

RUN apt update && apt-get install -y unixodbc unixodbc-dev odbcinst gnupg curl

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Install odbc driver for Synapse.
RUN apt update && ACCEPT_EULA=Y apt-get install -y libgssapi-krb5-2 msodbcsql17 mssql-tools

COPY  odbc.ini /etc/odbc.ini