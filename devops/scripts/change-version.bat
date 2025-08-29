@echo off

set VersionSelector=C:\JenkinsAgent\workspace\UELTS\Engine\Binaries\Win64\UnrealVersionSelector.exe

set ProjectName=TPS.uproject
set ProjectPath=..\..\%ProjectName%
for %%I in ("%ProjectPath%") do set "ProjectFullPath=%%~fI"

set EnginePath=C:\JenkinsAgent\workspace\UELTS

"%VersionSelector%" -switchversionsilent "%ProjectFullPath%" "%EnginePath%"

PAUSE