"C:\JenkinsAgent\workspace\UELTS\Engine\Build\BatchFiles\RunUAT.bat" ^
BuildCookRun ^
-project="C:\JenkinsAgent\workspace\Unreal Games\TPS\TPS.uproject" ^
-platform=Win64 -clientconfig=Shipping ^
-archivedirectory="C:\JenkinsAgent\workspace\Unreal Games\TPS\Package\FromBat" ^
-stagingdirectory="C:\JenkinsAgent\workspace\Unreal Games\TPS\Staging" ^
-build -cook -stage -archive -pak -package

PAUSE