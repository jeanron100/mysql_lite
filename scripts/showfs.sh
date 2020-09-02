data_dir=`$MYSQL_CMDNE  "select @@datadir" 2>/dev/null`
echo $data_dir
sudo du -sh  /data/mysql_${DB_PORT}/*
echo .
sudo du -sh  $data_dir
sudo du -sh  ${data_dir}/*
