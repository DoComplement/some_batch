# some_batch

## backup_env_paths
will simply copy the current System Environment Variables to a backup in case someone were to execute xset PATH ...
backed up files will never overlap

## install_lua
  - requires tdm_gcc with renamed make file to build the lua files
  - maybe mingw, I am not sure. if mingw isn't required the directory could be changed to TDM-GCC\...

will download, build, and install lua 5.4.7
  - if a new version is created, change 5.4.7 in the top of the batch file to whatever the new version is
  - the local environment path is copied to the clipboard once the script is completed (add the local env variable manually)
  - external libraries could be placed in the shared/lua/5.4 file

## build_lua
  - build a lua file into an exe from anywhere (needs terminal call ;( though) :D (granted you give the correct argument, which is legit just the filename with the extension)
  - see in the file the *%USERPROFILE%.personal* is the path for the respective local environment variable, so change that to whatever you desire, however you will be using the build file
  - see in the file the method uses srlua, but the install_lua batch file makes this possible! yay!, also srlua with modified Makefile is included here for convenience
    - the glue.exe and srlue.exe files are required to be in the directory *%USERPROFILE%.personal\build_lua* so if you want them in a different place, modify that too in the batch file
      %USERPROFILE% = %HOMEDRIVE%\%HOMEPATH% -> typically C:\Users\*main_user*

ex ezpz cmd call: build_lua test.lua
