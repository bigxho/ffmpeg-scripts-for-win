@echo on
@echo ***Convert to flac***
@echo ***Put this batch file in root folder***
:inconv
@set /P inconv="File type to convert, sample .mp4 -> "
@dir /b *%inconv% >list.txt
@md flac
@cls
@FOR /F "eol=f  tokens=1 delims=." %%p in (list.txt) DO (ffmpeg.exe -hwaccel_device 0 -i "%%p%inconv%" -af aformat=s32:176400 -compression_level 9 "flac/%%p.flac")
@del /f list.txt >nul
@echo __End of Converted File__
@echo Press Enter to Exit...
@pause >nul