@echo off

call "%~dp0\..\..\config.bat"

"%RunUATPath%" BuildCookRun ^
-project="%ProjectPath%" ^
-platform=%Platform% ^
-archivedirectory="%PackagePath%\Game" ^
-clientconfig="%Configuration%" ^
-build -cook -iterate -package -stage -archive -pak -allmaps -iostore -compressed