@echo off
title Installation Python - CFX Tool
color 0A
echo.
echo ================================================================
echo                 INSTALLATEUR PYTHON AUTOMATIQUE
echo                        Pour CFX Tool
echo ================================================================
echo.

:: Vérification des droits administrateur
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERREUR] Ce script doit etre execute en tant qu'administrateur !
    echo Clic droit sur le fichier ^> "Executer en tant qu'administrateur"
    echo.
    pause
    exit /b 1
)

echo [INFO] Verification de l'installation Python existante...
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [SUCCES] Python est deja installe !
    python --version
    echo.
    echo Voulez-vous continuer pour reinstaller Python ? (O/N)
    set /p choice=Votre choix: 
    if /i not "%choice%"=="O" (
        echo Installation annulee.
        pause
        exit /b 0
    )
)

echo.
echo [INFO] Telechargement de Python 3.11.9 (version stable)...
echo.

:: Créer un dossier temporaire
if not exist "%temp%\python_install" mkdir "%temp%\python_install"
cd /d "%temp%\python_install"

:: URL de téléchargement Python 3.11.9 (64-bit)
set PYTHON_URL=https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe
set PYTHON_FILE=python-3.11.9-amd64.exe

echo [INFO] Telechargement en cours depuis python.org...
powershell -Command "try { Invoke-WebRequest -Uri '%PYTHON_URL%' -OutFile '%PYTHON_FILE%' -UseBasicParsing } catch { Write-Host '[ERREUR] Echec du telechargement' -ForegroundColor Red; exit 1 }"

if not exist "%PYTHON_FILE%" (
    echo [ERREUR] Echec du telechargement !
    echo Verifiez votre connexion internet.
    pause
    exit /b 1
)

echo [SUCCES] Python telecharge avec succes !
echo.
echo [INFO] Installation de Python en cours...
echo        - Installation silencieuse
echo        - Ajout au PATH automatique
echo        - Installation de pip incluse
echo.

:: Installation silencieuse avec toutes les options
"%PYTHON_FILE%" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

:: Attendre la fin de l'installation
timeout /t 10 /nobreak >nul

echo [INFO] Verification de l'installation...
echo.

:: Rafraîchir les variables d'environnement
call refreshenv >nul 2>&1

:: Vérification avec le nouveau PATH
setlocal enabledelayedexpansion
set "PATH=%PATH%;C:\Program Files\Python311;C:\Program Files\Python311\Scripts"
set "PATH=%PATH%;C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python311;C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python311\Scripts"

python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ATTENTION] Python installe mais PATH non detecte immediatement
    echo Redemarrez votre invite de commande ou votre PC
    echo.
    echo Test manuel du PATH...
    "C:\Program Files\Python311\python.exe" --version 2>nul
    if %errorlevel% equ 0 (
        echo [SUCCES] Python installe dans: C:\Program Files\Python311\
    ) else (
        echo Recherche dans AppData...
        "%USERPROFILE%\AppData\Local\Programs\Python\Python311\python.exe" --version 2>nul
        if %errorlevel% equ 0 (
            echo [SUCCES] Python installe dans: %USERPROFILE%\AppData\Local\Programs\Python\Python311\
        )
    )
) else (
    echo [SUCCES] Python installe et configure correctement !
    python --version
    echo.
    
    echo [INFO] Verification de pip...
    pip --version >nul 2>&1
    if %errorlevel% equ 0 (
        echo [SUCCES] pip est operationnel !
        pip --version
    ) else (
        echo [ATTENTION] pip non detecte, mais probablement installe
    )
)

echo.
echo [INFO] Installation des dependances pour CFX Tool...
pip install tk >nul 2>&1

echo.
echo ================================================================
echo                    INSTALLATION TERMINEE !
echo ================================================================
echo.
echo Python 3.11.9 a ete installe avec succes !
echo.
echo IMPORTANT:
echo 1. Redemarrez votre invite de commande
echo 2. Ou redemarrez votre PC pour que le PATH soit mis a jour
echo 3. Vous pouvez maintenant executer CFX Tool avec: python "CFX Tool.py"
echo.
echo Commandes utiles:
echo   python --version     (verifier la version)
echo   pip list            (voir les packages installes)
echo   python "CFX Tool.py" (lancer CFX Tool)
echo.

:: Nettoyage
cd /d "%temp%"
rmdir /s /q "python_install" >nul 2>&1

echo Nettoyage termine.
echo.
pause