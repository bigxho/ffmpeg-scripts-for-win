echo off
title " # ffmpeg - desktop record --<>-- "
cls
:REGDESk
set /P inputLink=Scrivere il nome del file da registrare: 
if "%inputLink%"=="" goto Error_
rem
ffmpeg -f gdigrab -framerate 24 -i desktop -c:v h264_nvenc "%userprofile%\Videos\%inputLink%.mkv"
rem ffmpeg -f dshow -i audio="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{AFDE60E7-3C6E-4A85-88D0-6AA620224677}" -f gdigrab -framerate 24 -i desktop -c:v h264_nvenc -qp 0 "%userprofile%\Videos\%inputLink%.mkv"
goto EXIt
rem
:Error_
echo Inserisci il nome del file da registrare!!
rem
goto REGDESk
rem
:EXIt
echo **** Finished ****
echo Press Enter to Exit....
start Explorer "%userprofile%\Videos\"
rem
