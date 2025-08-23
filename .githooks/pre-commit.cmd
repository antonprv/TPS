@echo off
setlocal enabledelayedexpansion

rem --- Path to clang-format.exe ---
set "CLANG=C:\Program Files\LLVM\bin\clang-format.exe"
if not exist "%CLANG%" (
  echo [pre-commit] clang-format not found at %CLANG%
  exit /b 1
)

rem --- Marker for first run ---
set "MARKER=.git\.clang-format-all-done"
set /a COUNT=0

if not exist "%MARKER%" (
    echo [pre-commit] First run: formatting ALL tracked C++ files...
    for /f "usebackq delims=" %%F in (`git ls-files *.h *.hpp *.hxx *.inl *.cpp *.cc *.cxx`) do (
        if exist "%%F" (
            "%CLANG%" -i --style=file "%%F"
            git add "%%F"
            set /a COUNT+=1
        )
    )
    echo. > "%MARKER%"
) else (
    echo [pre-commit] Formatting STAGED C++ files...
    for /f "usebackq delims=" %%F in (`git diff --cached --name-only --diff-filter=ACMR -- *.h *.hpp *.hxx *.inl *.cpp *.cc *.cxx`) do (
        if exist "%%F" (
            "%CLANG%" -i --style=file "%%F"
            git add "%%F"
            set /a COUNT+=1
        )
    )
)

echo [pre-commit] clang-format applied to %COUNT% file(s).

endlocal
exit /b 0
