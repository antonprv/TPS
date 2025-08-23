@echo off
setlocal enabledelayedexpansion

set "CLANG=C:\Program Files\LLVM\bin\clang-format.exe"
if not exist "%CLANG%" (
  echo [pre-commit] clang-format not found at %CLANG%
  exit /b 1
)

set "MARKER=.git\.clang-format-all-done"
set /a COUNT=0

if not exist "%MARKER%" (
  echo [pre-commit] First run: formatting ALL tracked C++ files...
  for /f "delims=" %%F in ('git ls-files *.h *.hpp *.hxx *.inl *.cpp *.cc *.cxx') do (
    "%CLANG%" -i --style=file "%%F"
    git add "%%F"
    set /a COUNT+=1
  )
  echo. > "%MARKER%"
) else (
  echo [pre-commit] Formatting STAGED C++ files...
  for /f "delims=" %%F in ('git diff --cached --name-only --diff-filter=ACMR -- *.h *.hpp *.hxx *.inl *.cpp *.cc *.cxx') do (
    "%CLANG%" -i --style=file "%%F"
    git add "%%F"
    set /a COUNT+=1
  )
)

echo [pre-commit] clang-format applied to %COUNT% file(s).
endlocal
exit /b 0
