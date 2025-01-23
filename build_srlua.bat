@echo off

cd %USERPROFILE%\
if exist .personal (rmdir /S /Q .personal)
if exist some_batch (rmdir /S /Q some_batch)

git clone -q https://github.com/DoComplement/some_batch.git

ren some_batch .personal
cd .\.personal

if not exist build_lua (mkdir build_lua)


git clone -q https://github.com/LuaDist/srlua

del /Q srlua\Makefile
move Makefile srlua

cd srlua && make 
move .\*.exe ..\build_lua

cd ..
rmdir /S /Q srlua,.git
del /S /Q README.md


echo All done! yay!
pause