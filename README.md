# 发起这个项目的初衷？

我觉得很多MySQL DBA的管理工作似乎有些俗套，不断的刷show processlist,show slave status,select user,host from mysql.user等等，背都能背出来的一些命令，我觉得反复敲一些相同的命令是很枯燥的，而且在很多维护管理中其实是有一种无力感，如果能够让命令很深刻，能够解读出很多的信息，我觉得我们的工作幸福度也会提高一些，所以我打算把一些常用的简单的命令能根据经验简化后固化下来。

# 为什么要做这个开源项目？

行业里有很多不错的管理工具了，比如pt工具，比如一些性能分析工具等，做这个工具的意义是什么？我觉得这个小工具的目标就是小巧，简单和实用，并不是要做多么宏大的目标去解决一揽子问题，是让基础的管理工作更轻松一些。

我可以说得更具体一些，比如我们要查看一张表的基本信息，但是我不知道在哪个数据库中，我们常规的思路如下：
- 1）通过information_schema.tables去定位表名
- 2）得到表名后实用show create table xxxx得到建表语句
- 3）实用desc得到表结构的基本信息

如果这个过程秒级就能够直达，就会让原本枯燥的过程变得“锋利”起来。


# 目前的思考和所得有哪些

目前这个初版的框架已经基本整理出来了，大体包括如下的一些内容。

![Alt text](https://p3-tt.byteimg.com/origin/pgc-image/S9MHmKv13cor2j?from=pc)

我来简单解释一下，整个脚本内容可以按照find,show,check这三个基本维度展开， 
- find可以支持模糊匹配，精确查找，实现表，索引，字段层面的查找；
- show主要是对于一些对象和基本信息的展示，比如得到数据库的基本信息，得到binlog的基本信息，得到QPS等指标信息等；
- check是在这个基础上进一步完善的动作，我们可以实现一些快速检查工作，比如检查数据库中是否包含自增列溢出，检查用户权限，检查数据库中是否存在大量的短连接异常等，
- 此外补充了dump,internal,sql等几个模块，就是在这些基本管理之上进一步让工具更加丰富起来，支持一些更实用有效的功能。设计目标是小巧，简单和实用


# 有过哪些类似的经验

  之前开放了一部分脚本的项目dbm_lite,在Oracle数据库管理方向完全摆脱了界面管理，因为工作环境和网络限制等原因可以脚本化管理大量的线上环境，对于问题的快速定位是比较高效的，经历了大量的数据迁移的场景和问题排查。
  
# 如何使用
- 1）下载脚本到本地服务器，进入mysql_lite目录
- 2）假定管理员账号是dba_admin,密码为XXXX,则初始化密码一次 sh encrypt.sh XXXX，会生成一个静态的加密文件
- 3）如果当前服务器存在4306端口的实例服务，则执行命令 source init_lite 4306
- 4）执行命令source alias.lst
- 5）使用show，find，check等系列的命令

# 使用细则

| 脚本名称    | 脚本说明   | 相关参数 | 脚本实例 |  
| -------- | ------ | ---- | ------- |  
| showdb | 得到数据库的基本信息，数据库列表 | 无   | showdb    |
| showproc | show processlist的改进版，可以对线程进行多维度统计 | 无   | showproc    |
| showvar | 得到数据库配置参数列表 | 参数关键字   | showvar binlog    | 
| showfs | 得到数据库的文件目录统计 | 无   | showfs    |  
| showbinlog | binlog的列表，包括文件系统层的时间戳 | 无   | showbinlog    | 
| showbuffer | 得到数据库缓存的配置信息 | 无   | showbuffer    | 
| showerror | 数据库错误日志近1000行记录，会按照less模式显示 | 无   | showerror    | 
| showlock | 得到数据库相关锁的信息 | 无   | showlock    | 
| showusers | 得到数据库中的用户信息，包括加密后的密码串 | 无   |  showusers    | 
| showgrants | 得到指定用户的授权语句 | 用户名，主机名   |  showgrants test_user 127.0.0.1    | 
| showgtid | 得到数据库GTID的基本信息，包括GTID配置和当前GTID值 | 无   | showgtid    | 
| showstatus | 得到数据库运行状态的基本信息统计，如QPS,TPS等 | 无   | showstatus    | 
| showstatus2 | 简化版的showstatus命令输出 | 无   | showstatus2    | 
| finddict | 查找数据字典名称 | 数据字典关键字   | finddict lock    | 
| findtabs | 按照表名关键字模糊查找 | 表名关键字   | findtab test    | 
| findtab | 查找库名下相关的表   | 精确库名| findtab test   | 
| findtab | 按照库名，表名关键字查找相关的表 | 库名+表名关键字   | findtab test_db testx   | 
| showtab | 得到表的基本信息，包括create table语句和desc的结果 | 库名，精确表名   | showtab test_db test_table   | 

# 反馈交流
如果有相关问题，可以提交issue或者pull request
也可以在QQ群中沟通交流，QQ 群号：763628645
