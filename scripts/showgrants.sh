$MYSQL_CMDE "show  create user $1@'$2'\G" 2>/dev/null
echo 
$MYSQL_CMDE "show grants for $1@'$2'" 2>/dev/null
