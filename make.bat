@echo off
setlocal

set "_ROM_IN=mmzx-us.nds"

for %%f in ("%_ROM_IN%") do (
	set "_ROM_OUT=out\%%~nxf"
)

rmdir /S /Q out >nul
rmdir /S /Q temp >nul
mkdir temp >nul
if errorlevel 1 goto :error
mkdir out >nul
if errorlevel 1 goto :error

echo Extracting ROM...
tools\ndstool.exe -x "%_ROM_IN%" -9 temp\arm9.bin -7 temp\arm7.bin -d temp\data -y temp\overlay -h temp\header.bin -y9 temp\y9.bin -y7 temp\y7.bin -t temp\banner.bin
if errorlevel 1 goto :error

echo Pre-processing files...
tools\armips.exe src_pre.asm
if errorlevel 1 goto :error

echo Decompressing files...
tools\blz.exe -d temp\arm9.dec

echo Patching files...
tools\armips.exe src_patch.asm
if errorlevel 1 goto :error

echo Compressing files...
copy /Y temp\arm9.dec temp\arm9.bin
tools\blz.exe -en9 temp\arm9.bin

echo Post-processing files...
tools\armips.exe src_post.asm
if errorlevel 1 goto :error

echo Creating ROM...
tools\ndstool.exe -c "%_ROM_OUT%" -9 temp\arm9.bin -7 temp\arm7.bin -d temp\data -y temp\overlay -h temp\header.bin -y9 temp\y9.bin -y7 temp\y7.bin -t temp\banner.bin
if errorlevel 1 goto :error

echo Done.
exit /b 0

:error
pause