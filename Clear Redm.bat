@echo off
title Nettoyage COMPLET RedM
color 04
echo.
echo ================================================================
echo                   NETTOYAGE COMPLET REDM
echo                        !!! ATTENTION !!!
echo ================================================================
echo.
echo [ATTENTION] Cette operation va supprimer TOUTES les donnees RedM :
echo   - Tous les parametres et configurations
echo   - Historique des serveurs
echo   - Keybinds personnalises
echo   - Logs et crashes
echo   - Cache et donnees temporaires
echo.
echo Cette action est IRREVERSIBLE !
echo.
set /p confirm="Etes-vous ABSOLUMENT sur de continuer ? (tapez OUI): "
if /i not "%confirm%"=="OUI" (
    echo [ANNULE] Operation annulee par l'utilisateur
    pause
    exit /b 0
)

echo.
echo [DERNIERE CHANCE] Tapez encore OUI pour confirmer:
set /p confirm2="Confirmation finale: "
if /i not "%confirm2%"=="OUI" (
    echo [ANNULE] Operation annulee par l'utilisateur
    pause
    exit /b 0
)

:: Vérification que RedM n'est pas en cours d'exécution
tasklist /FI "IMAGENAME eq RedM.exe" 2>NUL | find /I /N "RedM.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo.
    echo [ERREUR] RedM est en cours d'execution !
    echo Fermez RedM avant de continuer.
    echo.
    pause
    exit /b 1
)

echo.
echo [INFO] Debut du nettoyage COMPLET RedM...
echo.

set "REDM_APP=%LOCALAPPDATA%\RedM\RedM.app"

if not exist "%REDM_APP%" (
    echo [ERREUR] Dossier RedM non trouve !
    echo Verifiez que RedM est installe dans : %LOCALAPPDATA%\RedM\
    echo.
    pause
    exit /b 1
)

echo [INFO] Dossier RedM trouve : %REDM_APP%
echo.

set deleted_count=0

:: Suppression du dossier crashes
if exist "%REDM_APP%\crashes" (
    echo [SUPPRESSION] Dossier crashes...
    rmdir /s /q "%REDM_APP%\crashes" 2>nul
    if exist "%REDM_APP%\crashes" (
        echo [ERREUR] Echec suppression crashes
    ) else (
        echo [SUCCES] Dossier crashes supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Dossier crashes inexistant
)

:: Suppression du dossier data (TOUT)
if exist "%REDM_APP%\data" (
    echo [SUPPRESSION] Dossier data complet...
    rmdir /s /q "%REDM_APP%\data" 2>nul
    if exist "%REDM_APP%\data" (
        echo [ERREUR] Echec suppression data
    ) else (
        echo [SUCCES] Dossier data supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Dossier data inexistant
)

:: Suppression du dossier logs
if exist "%REDM_APP%\logs" (
    echo [SUPPRESSION] Dossier logs...
    rmdir /s /q "%REDM_APP%\logs" 2>nul
    if exist "%REDM_APP%\logs" (
        echo [ERREUR] Echec suppression logs
    ) else (
        echo [SUCCES] Dossier logs supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Dossier logs inexistant
)

echo.
echo ================================================================
echo                      RESULTAT FINAL
echo ================================================================

if %deleted_count% gtr 0 (
    echo [SUCCES] RedM completement nettoye !
    echo [INFO] %deleted_count% dossiers principaux supprimes
    echo [INFO] TOUTES les donnees RedM ont ete effacees
    echo.
    echo [ATTENTION] Au prochain lancement de RedM :
    echo   - Vous devrez reconfigurer tous vos parametres
    echo   - Vos keybinds seront reinitialises
    echo   - L'historique des serveurs sera vide
) else (
    echo [INFO] Aucune donnee RedM a nettoyer
    echo [INFO] Tous les dossiers etaient deja vides ou inexistants
)

echo.
echo ================================================================
echo               NETTOYAGE COMPLET REDM TERMINE
echo ================================================================
echo.
pause