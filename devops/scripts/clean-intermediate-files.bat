echo off

set PROJ=..\..
set dirsToRemove=Intermediate DerivedDataCache Saved Binaries Build .vs
set filesToRemove="%PROJ%\*.sln"

echo removing intermediate files...

for %%f in (%dirsToRemove%) do (
	rmdir /s /q "%PROJ%\%%f"
)

for %%f in (%filesToRemove%) do (
	del /q %%f"
)

echo all intermediate files removed

PAUSE