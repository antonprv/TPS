@echo off

rem Engine params
set EnginePath_4.23=E:\UE_Other\UE_4.23
set EnginePath_5.3=D:\Games\UE_5.3
set EnginePath_5.6=C:\JenkinsAgent\workspace\UELTS

rem Select engine from the list
set SelectedEngine=%EnginePath_5.6%

rem !! Engine version for packaging !!
set RunUATPath=%EnginePath_5.6%\Engine\Build\BatchFiles\RunUAT.bat

rem Project params
set ProjectRoot=C:\JenkinsAgent\workspace\Unreal Games\TPS
set ProjectName=TPS
set ProjectFile=TPS.uproject
set ProjectPath=%ProjectRoot%\%ProjectFile%

rem Configuration params
set Platform=Win64
set Configuration=Development

rem Packaging params
set PackagePath=%ProjectRoot%\Package

rem Build Visual Studio Project files and change version
set VersionSelector=C:\JenkinsAgent\workspace\UELTS\Engine\Binaries\Win64\UnrealVersionSelector.exe

rem Target params
set EXTRA_MODULE_NAMES="%ProjectName%"

set TargetTemplatePath=C:\JenkinsAgent\workspace\Unreal Games\TPS\devops\scripts\Templates\GameModule.Target.cs.template

set TargetGameTemplatePath=C:\JenkinsAgent\workspace\Unreal Games\TPS\devops\scripts\Templates\GameOnlyModule.Target.cs.template

set GameIni=C:\JenkinsAgent\workspace\Unreal Games\TPS\Config\DefaultGame.ini

set SourceCodePath=C:\JenkinsAgent\workspace\Unreal Games\TPS\Source

exit /b
