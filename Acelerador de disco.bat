@echo off
setlocal

if "%~1"=="" goto MENU

REM Chamado via parametro (Node.js)
if "%~1"=="1" goto GERENCIADOR
if "%~1"=="2" goto INSTALAR
if "%~1"=="3" goto REINICIAR
if "%~1"=="4" goto DISKMARK
if "%~1"=="5" goto PRIMOCACHE
goto FIM

:MENU
echo ===================================
echo Painel Acelerador de Disco
echo ===================================
echo 1 - Gerenciador de Dispositivos
echo 2 - Instalar DiskMark/PrimoCache
echo 3 - Reiniciar
echo 4 - CrystalDiskMark
echo 5 - PrimoCache
pause
goto FIM

:GERENCIADOR
start devmgmt.msc
echo  Gerenciador aberto
goto FIM

:INSTALAR
if exist "%cd%\setup\Combo Instalador.exe" (
   start "" "%cd%\setup\Combo Instalador.exe"
   echo  Instalador aberto
) else (
   echo  Arquivo não encontrado!
)
goto FIM

:REINICIAR
shutdown /r /t 5
echo  Reiniciando em 5s...
goto FIM

:DISKMARK
if exist "C:\Program Files\CrystalDiskMark9\DiskMark64.exe" (
   start "" "C:\Program Files\CrystalDiskMark9\DiskMark64.exe"
   echo  CrystalDiskMark aberto
) else (
   echo  CrystalDiskMark não encontrado!
)
goto FIM

:PRIMOCACHE
if exist "C:\Program Files\PrimoCache\FancyCcV.exe" (
   start "" "C:\Program Files\PrimoCache\FancyCcV.exe"
   echo  PrimoCache aberto
) else (
   echo  PrimoCache não encontrado!
)
goto FIM

:FIM
endlocal
exit /b
