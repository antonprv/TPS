@echo off
setlocal enabledelayedexpansion

rem --- config ---
set "CLANG_FORMAT=clang-format"  rem or full path to clang-format.exe
rem ----------------

where "%CLANG_FORMAT%" >nul 2>nul
if errorlevel 1 (
  echo [pre-commit] clang-format not found. Install LLVM or add to PATH.
  exit /b 1
)

for /f "delims=" %%R in ('git rev-parse --show-toplevel') do set "REPO=%%R"
cd /d "%REPO%"

rem Format all tracked C/C++ files in the repo
for /f "delims=" %%F in ('
  git ls-files -- "*.h" "*.hpp" "*.hxx" "*.inl" "*.cpp" "*.cc" "*.cxx"
') do (
  "%CLANG_FORMAT%" -i --style=file --fallback-style=llvm "%%F"
  git add "%%F"
)

echo [pre-commit] clang-format applied.
exit /b 0
