@echo off
title Nettoyage COMPLET FiveM
color 04
echo.
echo ================================================================
echo                   NETTOYAGE COMPLET FIVEM
echo                        !!! ATTENTION !!!
echo ================================================================
echo.
echo [ATTENTION] Cette operation va supprimer TOUTES les donnees FiveM :
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

:: Vérification que FiveM n'est pas en cours d'exécution
tasklist /FI "IMAGENAME eq FiveM.exe" 2>NUL | find /I /N "FiveM.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo.
    echo [ERREUR] FiveM est en cours d'execution !
    echo Fermez FiveM avant de continuer.
    echo.
    pause
    exit /b 1
)

echo.
echo [INFO] Debut du nettoyage COMPLET FiveM...
echo.

set "FIVEM_APP=%LOCALAPPDATA%\FiveM\FiveM.app"

if not exist "%FIVEM_APP%" (
    echo [ERREUR] Dossier FiveM non trouve !
    echo Verifiez que FiveM est installe dans : %LOCALAPPDATA%\FiveM\
    echo.
    pause
    exit /b 1
)

echo [INFO] Dossier FiveM trouve : %FIVEM_APP%
echo.

set deleted_count=0

:: Suppression du dossier data (TOUT)
if exist "%FIVEM_APP%\data" (
    echo [SUPPRESSION] Dossier data complet...
    rmdir /s /q "%FIVEM_APP%\data" 2>nul
    if exist "%FIVEM_APP%\data" (
        echo [ERREUR] Echec suppression data
    ) else (
        echo [SUCCES] Dossier data supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Dossier data inexistant
)

:: Suppression du dossier logs
if exist "%FIVEM_APP%\logs" (
    echo [SUPPRESSION] Dossier logs...
    rmdir /s /q "%FIVEM_APP%\logs" 2>nul
    if exist "%FIVEM_APP%\logs" (
        echo [ERREUR] Echec suppression logs
    ) else (
        echo [SUCCES] Dossier logs supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Dossier logs inexistant
)

:: Suppression du dossier crashes
if exist "%FIVEM_APP%\crashes" (
    echo [SUPPRESSION] Dossier crashes...
    rmdir /s /q "%FIVEM_APP%\crashes" 2>nul
    if exist "%FIVEM_APP%\crashes" (
        echo [ERREUR] Echec suppression crashes
    ) else (
        echo [SUCCES] Dossier crashes supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Dossier crashes inexistant
)

echo.
echo ================================================================
echo                      RESULTAT FINAL
echo ================================================================

if %deleted_count% gtr 0 (
    echo [SUCCES] FiveM completement nettoye !
    echo [INFO] %deleted_count% dossiers principaux supprimes
    echo [INFO] TOUTES les donnees FiveM ont ete effacees
    echo.
    echo [ATTENTION] Au prochain lancement de FiveM :
    echo   - Vous devrez reconfigurer tous vos parametres
    echo   - Vos keybinds seront reinitialises
    echo   - L'historique des serveurs sera vide
) else (
    echo [INFO] Aucune donnee FiveM a nettoyer
    echo [INFO] Tous les dossiers etaient deja vides ou inexistants
)

echo.
echo ================================================================
echo               NETTOYAGE COMPLET FIVEM TERMINE
echo ================================================================
echo.
pause