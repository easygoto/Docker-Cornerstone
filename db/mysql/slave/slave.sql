# docker inspect containerID
CHANGE MASTER TO Master_Host='172.63.0.2', Master_User='slave', Master_Password='123123', Master_Port=3306, Master_Log_File='mysql-master-bin.000003', Master_Log_Pos= 839, Master_Connect_Retry=30;
START SLAVE;
# STOP SLAVE;
SHOW SLAVE STATUS;
