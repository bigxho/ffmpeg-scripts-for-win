echo off
title " # ffmpeg - CUDA video convert--<>-- "
cls
:CUDACV
set /P inputLink=Enter file_path to convert:: 
if "%inputLink%"=="" goto Error_
:CUDACV_OUT
set /P outputLink=FileName to output(*.mkv) or (*.mp4): 
if "%outputLink%"=="" goto Error2_
rem
ffmpeg -hwaccel_device 0 -hwaccel cuda -i "%inputLink%" -c:v h264_nvenc "%userprofile%\Videos\%outputLink%.mp4"
goto EXIt
rem
:Error_
echo Enter file_path to convert:: 
rem
goto CUDACV
rem
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