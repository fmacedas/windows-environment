@echo off
git.exe %*

:: Colors
set Color_Off=$E[0m

:: Regular Colors
set Black=$E[0;30m
set Red=$E[0;31m
set Green=$E[0;32m
set Yellow=$E[0;33m
set Blue=$E[0;34m
set Purple=$E[0;35m
set Cyan=$E[0;36m
set White=$E[0;37m

:: Bold
set BBlack=$E[1;30m
set BRed=$E[1;31m
set BGreen=$E[1;32m
set BYellow=$E[1;33m
set BBlue=$E[1;34m
set BPurple=$E[1;35m
set BCyan=$E[1;36m
set BWhite=$E[1;37m

:: Underline
set UBlack=$E[4;30m
set URed=$E[4;31m
set UGreen=$E[4;32m
set UYellow=$E[4;33m
set UBlue=$E[4;34m
set UPurple=$E[4;35m
set UCyan=$E[4;36m
set UWhite=$E[4;37m

:: Background
set On_Black=$E[40m
set On_Red=$E[41m
set On_Green=$E[42m
set On_Yellow=$E[43m
set On_Blue=$E[44m
set On_Purple=$E[45m
set On_Cyan=$E[46m
set On_White=$E[47m

:: High Intensty
set IBlack=$E[0;90m
set IRed=$E[0;91m
set IGreen=$E[0;92m
set IYellow=$E[0;93m
set IBlue=$E[0;94m
set IPurple=$E[0;95m
set ICyan=$E[0;96m
set IWhite=$E[0;97m

:: Bold High Intensty
set BIBlack=$E[1;90m
set BIRed=$E[1;91m
set BIGreen=$E[1;92m
set BIYellow=$E[1;93m
set BIBlue=$E[1;94m
set BIPurple=$E[1;95m
set BICyan=$E[1;96m
set BIWhite=$E[1;97m

:: High Intensty backgrounds
set On_IBlack=$E[0;100m
set On_IRed=$E[0;101m
set On_IGreen=$E[0;102m
set On_IYellow=$E[0;103m
set On_IBlue=$E[0;104m
set On_IPurple=$E[10;95m
set On_ICyan=$E[0;106m
set On_IWhite=$E[0;107m

:: Custom Variables
set C_User_Name=$E]9;8;"USERNAME"$E\
set C_Computer_Name=$E]9;8;"COMPUTERNAME"$E\
set C_Current_Time=$T
set C_Space=$S
set C_S=$$

set GITBRANCH=
set GITSTATUS=
for /f %%I in ('git.exe rev-parse --abbrev-ref HEAD 2^> NUL') do set GITBRANCH=%%I
for /f %%I in ('git.exe status ^| grep "nothing to commit"') do set GITSTATUS=%%I

if "%GITBRANCH%" == "" (
  prompt %Green%%C_User_Name%%White%@%Green%%C_Computer_Name%%C_Space%%IGreen%$P$_%Yellow%%C_Current_Time%%Color_Off%%C_Space%%C_S%%C_Space%
) else (
  if "%GITSTATUS%" == "" (
    prompt %Green%%C_User_Name%%White%@%Green%%C_Computer_Name%%C_Space%%IGreen%$P$_%Yellow%%C_Current_Time%%Color_Off%%C_Space%{%Red%%GITBRANCH%%Color_Off%}%C_Space%%C_S%%C_Space%
  ) else (
    prompt %Green%%C_User_Name%%White%@%Green%%C_Computer_Name%%C_Space%%IGreen%$P$_%Yellow%%C_Current_Time%%Color_Off%%C_Space%{%Green%%GITBRANCH%%Color_Off%}%C_Space%%C_S%%C_Space%
  )
)

