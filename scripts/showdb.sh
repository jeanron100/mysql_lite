$MYSQL_CMDE  "show variables where variable_name in('gtid_mode','port','character_set_server','innodb_buffer_pool_size')" 2>/dev/null
$MYSQL_CMDE  "select SCHEMA_NAME,DEFAULT_CHARACTER_SET_NAME from information_schema.schemata;" 2>/dev/null
#$MySQL_CMDE  "select @@gtid_mode,@@character_set_server,@@innodb_buffer_pool_size"
#$MySQL_CMDE  "select @@character_set_server,@@innodb_buffer_pool_size"
$MYSQL_CMDE  "show slave hosts" 2>/dev/null
