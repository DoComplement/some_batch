@echo off
setlocal enabledelayedexpansion

:: Get most recent version
:: Download the current Lua download page
curl -s https://www.lua.org/download.html > lua_page.html

:: Find the current version of Lua
for /f "delims=<>" %%A in ('findstr /c:"cd lua-" lua_page.html') do (
    SET RELEASE=%%A
	DEL lua_page.html
    GOTO :found
)

echo Version not found, exiting
exit

:found

SET RELEASE=%RELEASE:cd lua-=%
SET VERSION=%RELEASE:~0, -2%
SET PARENT=mingw

cd \MinGW

if exist lua-%RELEASE% (ren lua-%RELEASE% lua-%RELEASE%-backup)

:: download lua files
curl -sLRO https://www.lua.org/ftp/lua-%RELEASE%.tar.gz
@tar zxf lua-%RELEASE%.tar.gz
@del .\lua-%RELEASE%.tar.gz
@cd lua-%RELEASE%
make %PARENT%

SET TO_INC= lua.h luaconf.h lualib.h lauxlib.h lua.hpp

::install
mkdir bin,include,man\man1,share\lua\%VERSION%,lib\lua\%VERSION%


move src\*.dll bin
move src\*.exe bin
move doc\*.1 man\man1
move src\liblua.a lib

@for %%H in (%TO_INC%) do (move src\%%H include)


::clean
@move doc\*.html .\
del /Q doc\*.*,Makefile,README
rmdir /S /Q src
ren doc docs
@move .\*.html docs


::add lua.exe to path
echo %HOMEDRIVE%\MinGW\lua-%RELEASE%\bin | Clip.exe
echo If %HOMEDRIVE%\MinGW\lua-%RELEASE%\bin hasn't been added to your local Environment Variable Path, add that variable now
echo The path has been added to your clipboard

waitfor /SI SetupReady
