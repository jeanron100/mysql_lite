$MYSQL_CMDE "show variables like 'log_error'" 2>/dev/null
log_dir=`$MYSQL_CMDNE  "select @@log_error" 2>/dev/null`
sudo tail -1000  $log_dir|less
