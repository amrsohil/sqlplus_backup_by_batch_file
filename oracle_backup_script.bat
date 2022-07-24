ECHO OFF
:: Check WMIC is available
WMIC.EXE Alias /? >NUL 2>&1 || GOTO s_error

:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
      SET _second=00%%K
)
:s_done

:: Pad digits with leading zeros
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%
      Set _second=%_second:~-2%

Set logtimestamp=%_yyyy%-%_mm%-%_dd%_%_hour%_%_minute%_%_second%
goto make_dump

:s_error
echo WMIC is not available, using default log filename
Set logtimestamp=_

:make_dump
echo Amr Sohil Automatic SQLPlus Backup Solution
echo https://github.com/amrsohil/sqlplus_backup_by_batch_file/
echo please wait

:: Set delay time before starting backup process
TIMEOUT 3 

:: Use your own data
set uname=yoursqlplusuname
set pwd=yoursqlpluspwd
set dbuname=yourDBusername
set dbname=yourDBName
set backuppath=D:\my_oracle_backup
set firsttask=%dbname%-%_dd%-%_mm%-%_yyyy%.txt 
set sqlplusexe=D:\oracle\dbhome_1\BIN\sqlplus.exe

:: Commands and variables send to sqlplus, I think you can put whatever suits you here, each in a separate line
:: Don't forget to add echo quit at the end to make script return to excution mode
(
  echo $ exp %dbuname%/%dbname% file=%backuppath%-%_dd%-%_mm%-%_yyyy% LOG=%backuppath%-%_dd%-%_mm%-%_yyyy% ;
  echo quit
) > %firsttask%


echo System is ready to start backup process, please wait


CALL %sqlplusexe% %uname%/%pwd% < %firsttask%


EXIT
