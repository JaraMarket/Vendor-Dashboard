@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradle startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=-Dorg.gradle.internal.http.socketTimeout=300000 -Dorg.gradle.internal.http.connectionTimeout=300000 -Dorg.gradle.java.version=11

@rem Try to use a compatible Java version if available
if exist "C:\Program Files\Java\jdk-11" (
    set JAVA_HOME=C:\Program Files\Java\jdk-11
    echo Using Java 11
) else if exist "C:\Program Files\Java\jdk-17" (
    set JAVA_HOME=C:\Program Files\Java\jdk-17
    echo Using Java 17
) else if exist "C:\Program Files\Eclipse Adoptium\temurin-11.jdk" (
    set JAVA_HOME=C:\Program Files\Eclipse Adoptium\temurin-11.jdk
    echo Using Eclipse Temurin Java 11
) else if exist "C:\Program Files\Eclipse Foundation\jdk-11" (
    set JAVA_HOME=C:\Program Files\Eclipse Foundation\jdk-11
    echo Using Eclipse Java 11
) else if exist "C:\Program Files\AdoptOpenJDK\jdk-11" (
    set JAVA_HOME=C:\Program Files\AdoptOpenJDK\jdk-11
    echo Using AdoptOpenJDK 11
) else if exist "C:\Program Files\Eclipse Adoptium\jdk-11.0.20.101-hotspot" (
    set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-11.0.20.101-hotspot
    echo Using Eclipse Adoptium Java 11
) else if exist "C:\Program Files\Microsoft\jdk-11" (
    set JAVA_HOME=C:\Program Files\Microsoft\jdk-11
    echo Using Microsoft Java 11
) else (
    echo WARNING: No compatible Java version found. Gradle may fail.
    echo Please install Java 11 or 17 for compatibility with Gradle 7.6.1
    echo.
    echo Please download Java 11 from: https://adoptium.net/temurin/releases/?version=11
    echo Install it and try again.
)

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windowz variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

@rem Execute Gradle
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% "-Dorg.gradle.appname=%APP_BASE_NAME%" -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable GRADLE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%GRADLE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
