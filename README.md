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
  - external libraries could be places in the shared/lua/5.4 file
