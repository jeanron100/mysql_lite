echo '#######################'
echo 
echo $1.$2
echo 
echo '#######################'
$MYSQL_CMDE "select TABLE_NAME,TABLE_TYPE,ENGINE,TABLE_ROWS,AUTO_INCREMENT,CREATE_TIME,TABLE_COMMENT from information_schema.tables where table_schema not in ('sys','information_schema','performance_schema','mysql') and TABLE_SCHEMA='$1' and table_name = '$2';" 2>/dev/null
echo 
$MYSQL_CMDE "show create table $1.$2 \G" 2>/dev/null
echo 
$MYSQL_CMDE "desc  $1.$2;" 2>/dev/null
