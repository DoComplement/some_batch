@echo off

if not exist %1 (
 echo error: no argument provided
 exit /B
) else if %~x1 NEQ .lua (
 echo error: filetype is incorrect; %~x1 collected, .lua expected
 exit /B
)

SET fname=%~n1.exe
SET build=%USERPROFILE%\.personal\build_lua

%build%\glue.exe %build%\srlua.exe %~f1 %~dp1\%fname%