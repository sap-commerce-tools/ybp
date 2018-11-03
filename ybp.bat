@setlocal ENABLEEXTENSIONS

@set current=%cd%
@for /F %%I in ("%current%") do @set root=%%~dI

:loop
@if EXIST "%current%\hybris\bin\platform\*" (
    @set platform=%current%\hybris\bin\platform
)
@call :dirname "%current%" current
@IF NOT DEFINED platform IF NOT "%current%"=="%root%" goto :loop

@IF DEFINED platform (
    @cd "%platform%"
    @IF "%1"=="ant" (
        @call setantenv.bat
    )
    @%COMSPEC% /c %*
) ELSE (
    echo Could not find hybris/bin/platform folder, will NOT execute '%*' 1>&2
    @EXIT /B 1
)

@endlocal
@goto:EOF

:dirname file varName
    @setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
    @SET _dir=%~dp1
    @SET _dir=%_dir:~0,-1%
    @endlocal & set %2=%_dir%
@goto:EOF