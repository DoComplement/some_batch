@echo off
cd \MinGW

SET V=5.4
SET R=%V%.7
SET P=mingw

if exist lua-%R% (ren lua-%R% lua-%R%-backup)

:: download lua files
curl -sLRO https://www.lua.org/ftp/lua-%R%.tar.gz
@tar zxf lua-%R%.tar.gz
@del .\lua-%R%.tar.gz
@cd lua-%R%
make %P%

SET TO_INC= lua.h luaconf.h lualib.h lauxlib.h lua.hpp

::install
mkdir bin,include,man\man1,share\lua\%V%,lib\lua\%V%


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
echo %HOMEDRIVE%\MinGW\lua-%R%\bin | Clip.exe
echo If MinGW\Bin hasn't been added to your local Env Variable Path, go add that variable now
echo The path has been added to your clipboard

waitfor /SI SetupReady
