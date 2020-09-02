#select user,host from mysql.user order by user;
$MYSQL_CMDE "select concat(user,'@','\'',host,'\'') user,authentication_string from mysql.user order by user;" 2>/dev/null
