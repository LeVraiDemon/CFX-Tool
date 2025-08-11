@echo off
title Nettoyage Cache RedM
color 0C
echo.
echo ================================================================
echo                    NETTOYAGE CACHE REDM
echo ================================================================
echo.

:: Vérification que RedM n'est pas en cours d'exécution
tasklist /FI "IMAGENAME eq RedM.exe" 2>NUL | find /I /N "RedM.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo [ATTENTION] RedM est en cours d'execution !
    echo Fermez RedM avant de continuer.
    echo.
    pause
    exit /b 1
)

echo [INFO] Debut du nettoyage cache RedM...
echo.

set "REDM_DATA=%LOCALAPPDATA%\RedM\RedM.app\data"

if not exist "%REDM_DATA%" (
    echo [ERREUR] Dossier RedM non trouve !
    echo Verifiez que RedM est installe dans : %LOCALAPPDATA%\RedM\
    echo.
    pause
    exit /b 1
)

echo [INFO] Dossier RedM trouve : %REDM_DATA%
echo.

set deleted_count=0

:: Suppression du cache principal
if exist "%REDM_DATA%\cache" (
    echo [SUPPRESSION] Cache principal...
    rmdir /s /q "%REDM_DATA%\cache" 2>nul
    if exist "%REDM_DATA%\cache" (
        echo [ERREUR] Echec suppression cache principal
    ) else (
        echo [SUCCES] Cache principal supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Cache principal inexistant
)

:: Suppression du cache serveur
if exist "%REDM_DATA%\server-cache" (
    echo [SUPPRESSION] Cache serveur...
    rmdir /s /q "%REDM_DATA%\server-cache" 2>nul
    if exist "%REDM_DATA%\server-cache" (
        echo [ERREUR] Echec suppression cache serveur
    ) else (
        echo [SUCCES] Cache serveur supprime !
        set /a deleted_count+=1
    )
) else (
    echo [INFO] Cache serveur inexistant
)

:: Suppression du cache serveur privé
if exist "%REDM_DATA%\server-cache-priv" (
    echo [SUPPRESSION] Cache serveur prive...
    rmdir /s /q "%REDM_DATA%\server-cache-priv" 2>nul
    if exist "%REDM_DATA%\server-cache-priv" (
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
    echo [SUCCES] Cache RedM nettoye avec succes !
    echo [INFO] %deleted_count% dossiers supprimes
    echo [INFO] Vos parametres et configurations sont preserves
) else (
    echo [INFO] Aucun cache RedM a nettoyer
    echo [INFO] Tous les dossiers etaient deja vides ou inexistants
)

echo.
echo [INFO] Operation terminee !
echo Vous pouvez maintenant relancer RedM.
echo.
pause