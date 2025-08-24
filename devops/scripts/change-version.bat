@echo off

set VersionSelector=C:\JenkinsAgent\workspace\UELatestLTS\Engine\Binaries\Win64\UnrealVersionSelector.exe

set ProjectName=TPS.uproject
set ProjectPath=..\..\%ProjectName%
for %%I in ("%ProjectPath%") do set "ProjectFullPath=%%~fI"

set EnginePath=C:\JenkinsAgent\workspace\UELatestLTS

"%VersionSelector%" -switchversionsilent "%ProjectFullPath%" "%EnginePath%"

PAUSE