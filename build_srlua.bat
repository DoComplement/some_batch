@echo off

cd %USERPROFILE%\
if exist .\.personal (
	choice /M ".personal folder already exists, continue?"
	
	if errorlevel 2 (exit /b)
)

if exist .\.some_batch (
	choice /M "some_batch folder already exists, continue?"
	
	if errorlevel 2 (exit /b)
)

git clone -q https://github.com/DoComplement/some_batch.git .personal
cd .\.personal && mkdir build_lua

git clone -q https://github.com/LuaDist/srlua

del /Q .\srlua\Makefile
move Makefile .\srlua

cd .\srlua && make 
move .\*.exe ..\build_lua

cd ..
rmdir /S /Q .\srlua,.\.git
del /S /Q .\README.md


echo All done! yay!
pause
