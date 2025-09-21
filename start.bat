@echo off
title Iniciando Servidor EDCELL-TECH
color 0A
echo ===============================================
echo   Painel Acelerador de Disco - EDCELL-TECH
echo ===============================================
echo.

REM Verifica se Node.js está instalado
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo   Node.js nao encontrado! Instale em: https://nodejs.org/
    pause
    exit
)

REM Verifica se package.json existe
if not exist package.json (
    echo Criando package.json...
    call npm init -y
)

REM Verifica se express esta instalado
echo Verificando Express...
call npm list express >nul 2>nul
if %errorlevel% neq 0 (
    echo  Instalando Express...
    call npm install express
) else (
    echo Express ja esta instalado
)

REM Inicia o servidor Node.js em janela minimizada
echo   Iniciando servidor Node.js...
start "" /min cmd /c "node server.js"

REM Abre navegador maximizado
echo   Abrindo navegador em http://localhost:3000
start "" /max http://localhost:3000

echo ===============================================
echo    Servidor iniciado com sucesso!
echo ===============================================

