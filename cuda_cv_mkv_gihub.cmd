echo off
title "ffmpeg CUDAV convert->"
cls
:CUDACV_IN
set /P inputLink=Enter FileName to convert: 
if "%inputLink%"=="" goto Error_
:CUDACV_OUT
set /P outputLink=FileName to output(*.mkv) or (*.mp4): 
if "%outputLink%"=="" goto Error2_
rem
ffmpeg -hwaccel_device 0 -hwaccel cuda -i %inputLink% -map 0:a -map 0:v -map 0:s -c:s copy -c:a copy -c:v hevc_nvenc "%userprofile%/Videos/%outputLink%.mkv"
rem
goto EXIt
rem
:Error_
echo Enter file_path to convert:: 
goto CUDACV_IN
rem
:Error2_
echo Enter file_path to convert:: 
goto CUDACV_OUT
rem
:EXIt
echo **** Finished ****
echo Press Enter to Exit....
start Explorer "%userprofile%\Videos\"
rem
pause >nul