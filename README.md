# 🎮 CFX Tool - Gestionnaire RedM & FiveM

**CFX Tool** est un gestionnaire graphique moderne pour RedM et FiveM. Interface intuitive pour lancer vos jeux, nettoyer les caches et résoudre les problèmes en quelques clics. Console colorée avec système de couleurs automatique (vert=succès, rouge=erreurs, orange=infos).

## 🌟 Fonctionnalités

### 🚀 **Lancement Rapide**
- **Lancer RedM** en un clic (bouton rouge)
- **Lancer FiveM** instantanément (bouton orange)
- Détection automatique des installations
- Messages de confirmation dans la console

### 🧹 **Nettoyage Cache**
- **Cache RedM** : Supprime cache, server-cache, server-cache-priv
- **Cache FiveM** : Nettoie cache, nui-storage, server-cache, server-cache-priv
- Opérations sécurisées préservant vos paramètres
- Compteur de dossiers supprimés

### 🔥 **Nettoyage Complet**
- **RedM Complet** : Efface crashes, data, logs
- **FiveM Complet** : Supprime data, logs, crashes
- Confirmation obligatoire pour éviter les erreurs
- ⚠️ **Attention** : Supprime TOUS les paramètres et sauvegardes

### 📊 **Console Intelligente**
- **Console unique** centralisée pour tous les messages
- **Système de couleurs automatique** :
  - 🟢 **Vert** : Succès, lancements réussis, nettoyages terminés
  - 🔴 **Rouge** : Erreurs, fichiers non trouvés, échecs d'opération
  - 🟠 **Orange** : Informations, annulations, dossiers inexistants
- **Timestamps** sur chaque message pour traçabilité
- **Grande taille** (18 lignes) pour un suivi optimal
- **Auto-scroll** vers les derniers messages

## 📦 Installation

### Option 1 : Installation Automatique (Recommandée)

1. **Téléchargez** `install_python.bat`
2. **Clic droit** → **"Exécuter en tant qu'administrateur"**
3. **Suivez les instructions** du script d'installation automatique
4. **Redémarrez** votre invite de commande
5. **Double-clic** sur `CFX Tool.py` ou lancez : `python "CFX Tool.py"`

### Option 2 : Installation Manuelle

1. **Installez Python 3.11+** depuis [python.org](https://python.org)
2. **Téléchargez** `CFX Tool.py`
3. **Ouvrez** une invite de commande dans le dossier
4. **Double-clic** sur `CFX Tool.py` ou lancez : `python "CFX Tool.py"`

## 🚀 Utilisation

### Démarrage Rapide
- **Double-clic** sur `CFX Tool.py` pour lancer directement
- Ou en ligne de commande : `python "CFX Tool.py"`

### Interface Utilisateur Moderne
L'interface est organisée en **sections claires** avec une **console centralisée** :

#### 🎯 **Section Lancement**
- **Bouton Rouge** : Lancer RedM
- **Bouton Orange** : Lancer FiveM
- Messages de confirmation en vert dans la console

#### 🧽 **Section Nettoyage Cache**
- **Boutons Bleus** : Cache RedM / Cache FiveM
- Supprime uniquement les fichiers temporaires
- Préserve vos paramètres et configurations
- Compte des dossiers supprimés affiché

#### 🔥 **Section Nettoyage Complet**
- **Boutons Rouge/Orange** : Clear RedM / Clear FiveM
- ⚠️ **Confirmation obligatoire** avant suppression
- Efface TOUTES les données (paramètres, sauvegardes, logs)
- Messages détaillés du processus

#### 📊 **Console Centralisée**
- **Taille agrandie** pour une meilleure visibilité
- **Messages horodatés** avec format `[HH:MM:SS]`
- **Couleurs automatiques** selon le type d'opération
- **Historique complet** de toutes les actions

## 🎨 Interface Visuelle

```
┌─────────────────────────────────────────────────────────────┐
│                          CFX Tool                           │
│                Outil de gestion CFX RedM & FiveM            │
├─────────────────────────────────────────────────────────────┤
│  Lancement                                                  │
│  [Lancer RedM]         [Lancer FiveM]                       │
├─────────────────────────────────────────────────────────────┤
│  Nettoyage Cache                                            │
│  [Cache RedM]          [Cache FiveM]                        │
├─────────────────────────────────────────────────────────────┤
│  Nettoyage Complet                                          │
│  [Clear RedM Complet]  [Clear FiveM Complet]                │
├─────────────────────────────────────────────────────────────┤
│  Console                                                    │
│  [23:45:32] CFX Tool charge avec succes !                   │
│  [23:45:35] >>> SUCCES: RedM lance avec succes !    (VERT)  │
│  [23:45:40] Cache FiveM nettoye...                          │
│  [23:45:41] >>> 3 dossiers supprimes avec succes    (VERT)  │
│  [23:45:42] >>> INFO: Aucun cache a nettoyer       (ORANGE) │
│  [23:45:43] >>> ERREUR: Fichier non trouve          (ROUGE) │
│                                                             │
│                     [18 lignes visibles]                    │
└─────────────────────────────────────────────────────────────┘
```

## 📍 Emplacements des fichiers

### RedM
```
%LOCALAPPDATA%\RedM\
├── RedM.exe                    (Exécutable principal)
└── RedM.app\
    ├── crashes\               (Logs d'erreur - Nettoyage complet)
    ├── logs\                  (Journaux - Nettoyage complet)
    └── data\
        ├── cache\             (Cache principal - Nettoyage cache)
        ├── server-cache\      (Cache serveur - Nettoyage cache)
        └── server-cache-priv\ (Cache privé - Nettoyage cache)
```

### FiveM
```
%LOCALAPPDATA%\FiveM\
├── FiveM.exe                   (Exécutable principal)
└── FiveM.app\
    ├── crashes\               (Logs d'erreur - Nettoyage complet)
    ├── logs\                  (Journaux - Nettoyage complet)
    └── data\
        ├── cache\             (Cache principal - Nettoyage cache)
        ├── nui-storage\       (Stockage NUI - Nettoyage cache)
        ├── server-cache\      (Cache serveur - Nettoyage cache)
        └── server-cache-priv\ (Cache privé - Nettoyage cache)
```

## 🎨 Système de Couleurs de la Console

### 🟢 **Messages Verts (Succès)**
- `>>> SUCCES: [Action] réussie !`
- `✓ [Élément] supprimé avec succès`
- `[Jeu] lancé avec succès`
- `[X] dossiers supprimés avec succès`
- `=== NETTOYAGE COMPLET TERMINÉ ===`

### 🔴 **Messages Rouges (Erreurs)**
- `>>> ERREUR: [Description de l'erreur]`
- `Échec du lancement`
- `Fichier non trouvé`
- `Erreur de permission`

### 🟠 **Messages Orange (Informations)**
- `>>> INFO: [Information générale]`
- `>>> ANNULÉ: [Action annulée]`
- `Dossier inexistant: [nom]`
- `Aucun cache à nettoyer`
- `Aucune donnée à supprimer`

## ⚠️ Précautions Importantes

### 🔴 **Nettoyage Complet - DESTRUCTIF**
- **EFFACE TOUT** : Paramètres personnalisés, configurations serveur, keybinds
- **Confirmation obligatoire** avec popup de sécurité
- **Recommandé uniquement** pour problèmes majeurs ou réinstallation
- **Sauvegardez** vos paramètres importants avant utilisation

### 🟡 **Nettoyage Cache - SÉCURISÉ**
- **Supprime uniquement** les fichiers temporaires et cache
- **Conserve** tous vos paramètres et configurations
- **Recommandé régulièrement** pour optimiser les performances
- **Sans risque** pour vos données personnalisées

### 🟢 **Conseils de Sauvegarde**
Avant un nettoyage complet, sauvegardez manuellement :
- Vos keybinds personnalisés
- Paramètres graphiques optimisés
- Configurations de serveurs favoris
- Mods et ressources personnalisées

## 🐛 Dépannage & Solutions

### 🔧 **Problèmes Courants**

#### "Python non reconnu"
```bash
# Vérifiez l'installation
python --version

# Si erreur, utilisez l'installateur automatique
install_python.bat
```

#### "Console sans couleurs"
- Vérifiez que tkinter est bien installé
- Redémarrez l'application
- Les couleurs apparaissent automatiquement selon le contenu

#### "RedM/FiveM non trouvé"
```
>>> ERREUR: RedM.exe non trouve. Verifiez l'installation.
```
- Vérifiez l'installation dans `%LOCALAPPDATA%\RedM\`
- Réinstallez RedM/FiveM si nécessaire
- Vérifiez les permissions du dossier

#### "Erreurs de permission"
```
>>> ERREUR: Suppression [dossier] echoue - PermissionError
```
- **Fermez RedM/FiveM** avant nettoyage
- Exécutez en tant qu'administrateur si nécessaire
- Vérifiez qu'aucun processus n'utilise les fichiers

### 📊 **Messages de Debug**
La console affiche des informations détaillées :
- Nombre exact de dossiers traités
- Noms des dossiers supprimés
- Raisons des échecs d'opération
- Confirmations d'actions réussies

## 🔧 Informations Techniques

### Prérequis Système
- **Windows** 7/8/10/11
- **Python** 3.11+ (installé automatiquement)
- **tkinter** (inclus avec Python)
- **Modules standard** : os, subprocess, shutil, threading, datetime

### Architecture de l'Application
```python
CFXTool/
├── __init__()              # Interface graphique moderne
├── setup_styles()          # Thème sombre avec boutons colorés
├── create_main_interface() # Layout en sections organisées
├── lighten_color()         # Effets hover subtils
├── update_status()         # Console colorée intelligente
├── launch_redm/fivem()     # Lancement avec vérifications
├── clear_*_cache()         # Nettoyage sélectif sécurisé
├── clear_*_all()           # Nettoyage complet avec confirmation
└── run_in_thread()         # Opérations non-bloquantes
```

### Fonctionnalités Techniques
- **Interface non-redimensionnable** pour stabilité
- **Threading** pour opérations non-bloquantes
- **Gestion d'erreurs** robuste avec try/catch
- **Console auto-scrollable** avec historique
- **Système de tags** pour coloration dynamique
- **Confirmations utilisateur** pour opérations critiques

## 📝 Changelog

### v1.0.0 - Version Actuelle
- ✅ Interface graphique moderne avec thème sombre
- ✅ Lancement RedM/FiveM avec détection automatique
- ✅ Nettoyage cache sélectif (préserve paramètres)
- ✅ Nettoyage complet avec confirmation obligatoire
- ✅ Console centralisée unique (18 lignes)
- ✅ Système de couleurs automatique (vert/rouge/orange)
- ✅ Messages horodatés avec timestamps
- ✅ Boutons avec effets hover subtils (sans grossissement)
- ✅ Threading pour opérations non-bloquantes
- ✅ Installateur Python automatique inclus
- ✅ Suppression des popups (tout dans la console)
- ✅ Gestion intelligente des dossiers inexistants

## 🤝 Support & FAQ

### ❓ **Questions Fréquentes**

**Q: Pourquoi les couleurs n'apparaissent pas ?**
R: Les couleurs sont automatiques selon le contenu. Vérifiez que tkinter fonctionne correctement.

**Q: Différence entre nettoyage cache et complet ?**
R: 
- **Cache** = Seulement fichiers temporaires (SÉCURISÉ)
- **Complet** = TOUT (paramètres, configs, etc.) - DESTRUCTIF

**Q: L'application se bloque pendant le nettoyage ?**
R: Normal ! Les opérations se font en arrière-plan. Surveillez la console pour le progrès.

**Q: Comment sauvegarder mes paramètres ?**
R: Copiez manuellement le dossier `data` avant un nettoyage complet.

### 📞 **Signaler un Problème**
Pour signaler un bug, incluez :
- **Message d'erreur exact** de la console
- **Étapes pour reproduire** le problème
- **Version Python** utilisée (`python --version`)
- **Système d'exploitation** et version

## 📄 License

Ce projet est sous licence **MIT**. Libre d'utilisation, modification et distribution.

---

<div align="center">

**🎮 CFX Tool - Votre compagnon RedM & FiveM 🎮**

*Interface moderne • Console intelligente • Opérations sécurisées*

*Développé avec ❤️ pour la communauté CFX*

</div>
