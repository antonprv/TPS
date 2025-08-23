@echo off
setlocal enabledelayedexpansion
set "CLANG_FORMAT=clang-format"

where "%CLANG_FORMAT%" >nul 2>nul || (echo clang-format not found& exit /b 1)

for /f "delims=" %%R in ('git rev-parse --show-toplevel') do set "REPO=%%R"
cd /d "%REPO%"

for /f "delims=" %%F in ('
  git diff --cached --name-only --diff-filter=ACMR --
  "*.h" "*.hpp" "*.hxx" "*.inl" "*.cpp" "*.cc" "*.cxx"
') do (
  "%CLANG_FORMAT%" -i --style=file --fallback-style=llvm "%%F"
  git add "%%F"
)

echo [pre-commit] formatted staged files.
exit /b 0
