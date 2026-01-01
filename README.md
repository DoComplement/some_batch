# some_batch

## backup_env_paths
will simply copy the current System Environment Variables to a backup in case someone were to execute xset PATH ...
backed up files will never overlap

## install_lua
requires:
  -  **TDM-GCC** with renamed make file *(/TDM-GCC-64/bin/mingw32-make.exe -> .../make.exe)* to build lua files <br> https://jmeubank.github.io/tdm-gcc/download/
  - **Git Bash** for cloning a repository https://git-scm.com/install/
  - **MinGW** for file compilation and management https://sourceforge.net/projects/mingw/files/latest/download

will download, build, and install the most recent version of lua onto your system
  - the local environment path is copied to the clipboard once the script is completed (add the local environment variable manually)
  - external lua libraries are to be placed in the .../shared/lua/%VERSION% file

## build_srlua
  - requires **TDM-GCC** and **Git Bash**
  - will sort all these files into the system (*to %USERPROFILE%/.personal*, will have to add that to the environment path also)
  - will build the `srlua.exe` and `glue.exe` files

can also just run the following code:
```
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
```

## build_lua
  - build a lua file into an exe from anywhere (needs terminal call ;( though) :D (granted you give the correct argument, which is legit just the filename with the extension)
  - see in the file the *%USERPROFILE%/.personal* is the path for the respective local environment variable, so change that to whatever you desire, however you will be using the build file
  - see in the file the method uses srlua, but the install_lua batch file makes this possible! yay!, also srlua with modified Makefile is included here for convenience
    - the glue.exe and srlue.exe files are required to be in the directory *%USERPROFILE%/.personal/build_lua* so if you want them in a different place, modify that too in the batch file

      %USERPROFILE% = %HOMEDRIVE%\\%HOMEPATH% -> typically C:\Users\\*main_user*

***example cmd call***: `C:\Users\local>build_lua test.lua`
