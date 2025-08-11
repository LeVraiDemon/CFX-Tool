# CFX Tool - Gestionnaire RedM & FiveM

Un outil simple pour gérer RedM et FiveM. Interface graphique pour lancer les jeux, nettoyer les caches et résoudre les problèmes courants.

## Fonctionnalités

**Lancement des jeux**
- Lancer RedM ou FiveM en un clic
- Détection automatique des installations

**Nettoyage cache**
- Nettoie les caches temporaires (sécurisé)
- Garde vos paramètres et configurations intacts
- Cache RedM : supprime cache, server-cache, server-cache-priv
- Cache FiveM : supprime cache, nui-storage, server-cache, server-cache-priv

**Nettoyage complet** 
- Supprime TOUTES les données (attention !)
- Efface crashes, data, logs, paramètres
- Demande confirmation avant de continuer

**Console**
- Messages avec couleurs (vert=ok, rouge=erreur, orange=info)
- Affichage de l'heure sur chaque message
- Historique des actions

## Installation

**Méthode simple :**
1. Télécharger `install_python.bat`
2. Clic droit > "Exécuter en tant qu'administrateur" 
3. Suivre les instructions
4. Redémarrer l'invite de commande
5. Double-clic sur `CFX Tool.py`

**Installation manuelle :**
1. Installer Python 3.11+ depuis python.org
2. Télécharger `CFX Tool.py`
3. Double-clic sur le fichier ou `python "CFX Tool.py"`

## Utilisation

L'interface est divisée en sections :

- **Lancement** : Boutons rouge (RedM) et orange (FiveM)
- **Cache** : Boutons bleus pour nettoyer les caches
- **Complet** : Boutons rouge/orange pour tout supprimer
- **Console** : Affiche les messages et résultats

## Emplacements des fichiers

**RedM :** `%LOCALAPPDATA%\RedM\`
- RedM.exe 
- RedM.app\crashes\ (supprimé avec nettoyage complet)
- RedM.app\logs\ (supprimé avec nettoyage complet)  
- RedM.app\data\cache\ (supprimé avec nettoyage cache)
- RedM.app\data\server-cache\ (supprimé avec nettoyage cache)

**FiveM :** `%LOCALAPPDATA%\FiveM\`
- FiveM.exe
- FiveM.app\crashes\ (supprimé avec nettoyage complet)
- FiveM.app\logs\ (supprimé avec nettoyage complet)
- FiveM.app\data\cache\ (supprimé avec nettoyage cache) 
- FiveM.app\data\nui-storage\ (supprimé avec nettoyage cache)
- FiveM.app\data\server-cache\ (supprimé avec nettoyage cache)

## Attention !

**Nettoyage cache** - Pas de risque, supprime seulement les fichiers temporaires

**Nettoyage complet** - DANGEREUX ! Supprime tous vos paramètres, configurations, keybinds personnalisés. À utiliser seulement en cas de gros problèmes.

Sauvegardez vos paramètres importants avant un nettoyage complet !

## Problèmes courants

**"Python non reconnu"**
- Utiliser `install_python.bat` ou réinstaller Python manuellement
- Redémarrer l'invite de commande après installation

**"Jeu non trouvé"** 
- Vérifier que RedM/FiveM est bien installé
- Chercher dans `%LOCALAPPDATA%\RedM\` ou `%LOCALAPPDATA%\FiveM\`

**"Erreur de permission"**
- Fermer complètement RedM/FiveM avant nettoyage
- Essayer en tant qu'administrateur si nécessaire

## Scripts .bat inclus

Fichiers autonomes pour utilisation sans l'interface graphique :

- `Cache RedM.bat` - Nettoie juste le cache RedM
- `Cache FiveM.bat` - Nettoie juste le cache FiveM  
- `Clear RedM Complet.bat` - Supprime tout RedM (avec confirmations)
- `Clear FiveM Complet.bat` - Supprime tout FiveM (avec confirmations)

## Configuration requise

- Windows 7/8/10/11
- Python 3.11+ (installé automatiquement avec le .bat)

L'outil fonctionne avec les modules Python standards, pas besoin d'installer d'autres dépendances.
