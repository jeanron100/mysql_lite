#$MYSQL_CMDE "show binary logs" 2>/dev/null
log_path=`$MYSQL_CMDNE 'select @@log_bin_basename' 2>/dev/null`
ls -lh $log_path*|awk '{print $5" \t"$6" "$7" \t" $8 " \t"$9}'
#ls -lh $log_path*
