@echo off

if not exist %USERPROFILE%\backup_env_paths (mkdir %USERPROFILE%\backup_env_paths)
cd %USERPROFILE%\backup_env_paths

SET /a count=1
for %%A in (.\*.*) do (SET /a count=%count%+1)

SET filename=backup%count%.txt

echo %PATH% > %filename%
echo System Environment Variables Path has been saved to %USERPROFILE%\backup_env_paths\%filename%

exit /B


SET PROGS=%USERPROFILE%\AppData\Local\Programs

:: new environment path variables
SET WindowsApps=%USERPROFILE%\AppData\Local\Microsoft\WindowsApps
SET LUA=%HOMEDRIVE%\MinGW\lua-5.4.7\bin
SET PY3=%PROGS%\Python\Python313\
SET PYS=%PY3%Scripts
SET NPM=%USERPROFILE%\AppData\Roaming\npm
SET ROK=%USERPROFILE%\.rokit\bin

SET OLD_PATH=%PATH%
SET NEW_PATH=%PYS%;%PY3%;%WindowsApps%;%LUA%;%NPM%;%ROK%

echo Old Global and Local PATH: %OLD_PATH% > %filename%
echo New Local PATH: %NEW_PATH% >> %filename%

setx PATH %NEW_PATH%
echo C:\Users\ct_na\AppData\Local\Programs\Microsoft VS Code\bin | Clip.exe
echo update the last variable manually
pause