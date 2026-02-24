@echo off
REM ============================================================
REM  COBOL Compile & Run Script for GnuCOBOL on Windows
REM ============================================================
REM
REM  USAGE:  run.bat [program-name-without-extension]
REM  Example: run.bat HELLO
REM
REM  PREREQUISITES:
REM    Set GNUCOBOL_HOME below to your GnuCOBOL install folder.
REM ============================================================

REM --- CONFIGURE THIS: point to where you extracted GnuCOBOL ---
IF NOT DEFINED GNUCOBOL_HOME (
    SET "GNUCOBOL_HOME=C:\GnuCOBOL"
)

REM --- Validate GnuCOBOL installation ---
IF NOT EXIST "%GNUCOBOL_HOME%\set_env.cmd" (
    echo.
    echo ERROR: GnuCOBOL not found at %GNUCOBOL_HOME%
    echo.
    echo Please either:
    echo   1. Set GNUCOBOL_HOME environment variable, or
    echo   2. Edit this script and set GNUCOBOL_HOME above.
    echo.
    echo Download GnuCOBOL from:
    echo   https://www.arnoldtrembley.com/GnuCOBOL.htm
    echo.
    exit /b 1
)

REM --- Set up GnuCOBOL environment ---
call "%GNUCOBOL_HOME%\set_env.cmd" > nul 2>&1

REM --- Determine program name ---
SET "PROG=%~1"
IF "%PROG%"=="" SET "PROG=HELLO"

SET "SRC=%PROG%.cbl"
SET "EXE=%PROG%.exe"

REM --- Check source file exists ---
IF NOT EXIST "%SRC%" (
    echo ERROR: Source file "%SRC%" not found.
    echo Make sure you are running this from the folder containing your .cbl files.
    exit /b 1
)

echo.
echo --- Compiling %SRC% ---
cobc -x -free -o %EXE% %SRC%

IF %ERRORLEVEL% NEQ 0 (
    echo.
    echo COMPILATION FAILED. Check the errors above.
    exit /b 1
)

echo --- Compilation successful ---
echo.
echo --- Running %EXE% ---
echo.
%EXE%

echo.
echo --- Done ---

