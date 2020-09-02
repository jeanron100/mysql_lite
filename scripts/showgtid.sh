$MYSQL_CMDE "show variables like '%gtid%'" 2>/dev/null
$MYSQL_CMDE "show master status\G" 2>/dev/null
echo 
