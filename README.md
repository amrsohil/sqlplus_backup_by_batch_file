# sqlplus_backup_by_batch_file
Simple windows batch file to make automatically backups for  Oracle Database using SQLPLUS

The idea is to make a batch file start and send commands to sqlplus and wait until completed (exp db command).

variables in the script:

set uname=yoursqlplusuname
set pwd=yoursqlpluspwd
set dbuname=yourDBusername
set dbname=yourDBName
set backuppath=D:\my_oracle_backup (your desired path for sqlplus exported files)
set firsttask=%dbname%-%_dd%-%_mm%-%_yyyy%.txt  (this file is created when a backup is in process, it simply act as a container for sqlplus commands)
set sqlplusexe=D:\oracle\dbhome_1\BIN\sqlplus.exe (set the location of sqlplus.exe file)
