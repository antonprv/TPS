@echo off

call "%~dp0\..\config.bat"

"%VersionSelector%" -switchversionsilent "%ProjectFullPath%" "%SelectedEngine%"

PAUSE