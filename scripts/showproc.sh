$MYSQL_CMDE "select count(*) total_sess_cnt from information_schema.processlist;select user,count(*) sess_cnt from (select user, substring(host,1,instr(host,':')-1) host  from information_schema.processlist ) t group by user order by sess_cnt;
" 2>/dev/null

$MYSQL_CMDE "select  substring(host,1,instr(host,':')-1) host ,count(*) cnt from information_schema.processlist  group by  substring(host,1,instr(host,':')-1)  order by cnt,host;" 2>/dev/null

$MYSQL_CMDE "select user,substring(host,1,instr(host,':')-1)  host ,count(*) sess_cnt,avg(TIME_MS/1000) \"avg(TIME_SEC)\",avg(ROWS_SENT),avg(ROWS_EXAMINED) from information_schema.processlist group by user,substring(host,1,instr(host,':')-1) order by sess_cnt desc;" 2>/dev/null
