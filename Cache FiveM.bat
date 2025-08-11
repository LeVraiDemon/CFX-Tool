@echo off
title Nettoyage Cache FiveM
color 06
echo.
echo ================================================================
echo                    NETTOYAGE CACHE FIVEM
echo ================================================================
echo.

:: Vérification que FiveM n'est pas en cours d'exécution
tasklist /FI "IMAGENAME eq FiveM.exe" 2>NUL | find /I /N "FiveM.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo [ATTENTION] FiveM est en cours d'execution !
    echo Fermez FiveM avant de continuer.
    echo.
    pause
    exit /b 1
)

echo [INFO] Debut du nettoyage cache FiveM...
echo.

set "FIVEM_DATA=%LOCALAPPDATA%\FiveM\FiveM.app\data"

if not exist "%FIVEM_DATA%" (
    echo [ERREUR] Dossier FiveM non trouve !
    echo Verifiez que FiveM est installe dans : %LOCALAPPDATA%\FiveM\
    echo.
    pause
    exit /b 1
)

echo [INFO] Dossier FiveM trouve : %FIVEM_DATA%
echo.

set deleted_count=0

:: Suppression du cache principal
if exist "%FIVEM_DATA%\cache" (
    echo [SUPPRESSION] Cache principal...
    rmdir /s /q "%FIVEM_DATA%\cache" 2>nul
    if exist "%FIVEM_DATA%\cache" (
        echo [ERREUR] Echec suppression cache principal
    ) else (
        echo [SUCCES] Cache principal supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Cache principal inexistant
)

:: Suppression du stockage NUI
if exist "%FIVEM_DATA%\nui-storage" (
    echo [SUPPRESSION] Stockage NUI...
    rmdir /s /q "%FIVEM_DATA%\nui-storage" 2>nul
    if exist "%FIVEM_DATA%\nui-storage" (
        echo [ERREUR] Echec suppression stockage NUI
    ) else (
        echo [SUCCES] Stockage NUI supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Stockage NUI inexistant
)

:: Suppression du cache serveur
if exist "%FIVEM_DATA%\server-cache" (
    echo [SUPPRESSION] Cache serveur...
    rmdir /s /q "%FIVEM_DATA%\server-cache" 2>nul
    if exist "%FIVEM_DATA%\server-cache" (
        echo [ERREUR] Echec suppression cache serveur
    ) else (
        echo [SUCCES] Cache serveur supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Cache serveur inexistant
)

:: Suppression du cache serveur privé
if exist "%FIVEM_DATA%\server-cache-priv" (
    echo [SUPPRESSION] Cache serveur prive...
    rmdir /s /q "%FIVEM_DATA%\server-cache-priv" 2>nul
    if exist "%FIVEM_DATA%\server-cache-priv" (
        echo [ERREUR] Echec suppression cache serveur prive
    ) else (
        echo [SUCCES] Cache serveur prive supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Cache serveur prive inexistant
)

echo.
echo ================================================================
echo                      RESULTAT FINAL
echo ================================================================

if %deleted_count% gtr 0 (
    echo [SUCCES] Cache FiveM nettoye avec succes !
    echo [INFO] %deleted_count% dossiers supprimes
    echo [INFO] Vos parametres et configurations sont preserves
) else (
    echo [INFO] Aucun cache FiveM a nettoyer
    echo [INFO] Tous les dossiers etaient deja vides ou inexistants
)

echo.
echo [INFO] Operation terminee !
echo Vous pouvez maintenant relancer FiveM.
echo.
pause