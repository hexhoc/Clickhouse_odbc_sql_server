# Click house with ODBC to SQL Server
Click house server with a configured odbs driver to connect to the MS SQL server
## Installation
1. Configure odbc.ini file
2. Perform docker build
docker build --no-cache -t my/clickhouse-server -f clickhouse.dockerfile .

3. Next perform docker run
docker run -d --name ch-server -p 8123:8123 -p 9000:9000 --ulimit nofile=262144:262144 --volume=E:/docker/clickhouse/databases:/var/lib/clickhouse my/clickhouse-server

4. If you need create a new user, then
	3.1. open file \etc\clickhouse-server\users.xml and uncommented next line - <access_management>1</access_management>
	3.2. print "clickhouse-client" in docker bash
	3.3. print CREATE USER IF NOT EXISTS user1 IDENTIFIED WITH plaintext_password BY 'pass1'

5. Make fun. For example you can use next query
SELECT `col1` FROM odbc('DSN=mssql;uid=sa;Pwd=root;MARS_Connection=Yes;', 'tablename')

