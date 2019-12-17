# README

<br>

---

## What's this

-   This is the files for creating environment for development.
-   if it is executed, 3 containers are created. for app(Ruby on Rails), for, web-server, for database.

<br>

---

## How to use

1.  Download & install Docker & Docker compose.

2.  Create AWS account & setting. (The following should be setting at least）

    1.  IAM
    2.  S3

3.  Set folder in working directory.

    ~~~
    --- work_dir
     |
     -- set
    ~~~

4.  Create .env file

    -   set/file/mysql/mysql.env

        ~~~sh
        MYSQL_ROOT_PASSWORD=""
        ~~~

    -   set/file/rails/rails.env

        ~~~sh
        MYSQL_ENCODING=""
        MYSQL_USER=""
        MYSQL_PASSWORD=""
        MYSQL_DATABASE=""
        AWS_ACCESS_KEY=""
        AWS_SECRET_ACCESS_KEY=""
        AWS_BUCKET=""
        AWS_REGION=""
        ~~~

5.  Execute init file.

    ~~~sh
    source dockerfile_init.sh
    ~~~

6.  Execute boot file.

    ~~~sh
    source dockerfile_boot.sh
    ~~~

7.  If you want to stop, execute stop file.

    ~~~sh
    source dockerfile_stop.sh
    ~~~