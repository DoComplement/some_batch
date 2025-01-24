@echo off

if "%1"=="" (
 echo error: no argument provided
 exit /B
) else if not "%~x1"==".lua" (
 echo error: filetype is incorrect; .lua expected, got %~x1
 exit /B
) else if not exist "%~f1" (
 echo error: couldn't find "%~f1"
 exit /B
)

SET fname=%~n1.exe
SET build=%USERPROFILE%\.personal\build_lua

%build%\glue.exe %build%\srlua.exe "%~f1" "%~dp1%fname%"
echo built "%~dp1%fname%"
