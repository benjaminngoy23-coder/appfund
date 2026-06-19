# FundFlow

FundFlow est une application web interne de gestion des demandes de fonds, demandes de matériel, suivi administratif et rapports véhicules.

Cette version est autonome : elle fonctionne avec Python standard et SQLite, sans Flask ni Django.

## Fonctionnalités principales

- Connexion utilisateurs par rôle.
- Création de demandes de fonds, matériel ou autres besoins.
- Circuit de validation : agent → chef/évaluateur de département → finance → administrateur.
- Gestion des chauffeurs et rapports véhicules.
- Suivi GPS/GPRS si l'utilisateur partage sa position.
- Mot de passe oublié avec demande de réinitialisation.
- Réinitialisation du mot de passe par l'administrateur.
- Gestion des fonctions : Déclarant, DRH, Chauffeur, Chef d'agence, Finance, Logistique, etc.
- Paramètres administrateur avec logo de l'entreprise.

## Lancement local

### Windows

Double-cliquer sur :

```bat
LANCER_FUNDFLOW.bat
```

Ou lancer dans le terminal :

```bash
python app.py
```

### Linux / macOS

```bash
chmod +x START_LOCAL_LINUX_MAC.sh
./START_LOCAL_LINUX_MAC.sh
```

Ou :

```bash
python3 app.py
```

## Premier compte administrateur

Au premier démarrage, configurez `ADMIN_EMAIL` et `ADMIN_PASSWORD`. Si le mot
de passe n’est pas défini, l’application en génère un temporaire et l’affiche
une seule fois dans les logs du serveur. Les comptes de démonstration sont
désactivés par défaut.

## Dépôt sur GitHub

Dans le dossier du projet :

```bash
git init
git add .
git commit -m "Première version de FundFlow"
git branch -M main
git remote add origin https://github.com/VOTRE-NOM-UTILISATEUR/fundflow.git
git push -u origin main
```

Remplace `VOTRE-NOM-UTILISATEUR` par ton nom GitHub.

## Déploiement sur Render

Le projet contient déjà `render.yaml`.

Paramètres manuels possibles sur Render :

```text
Build Command: pip install -r requirements.txt
Start Command: python app.py --no-browser
```

Variables d'environnement recommandées :

```text
DATA_DIR=/tmp/fundflow_data
PYTHON_VERSION=3.12.7
```

## Déploiement sur Railway

Le projet contient déjà `railway.json`.

Start Command :

```bash
python app.py --no-browser
```

## Vérification après déploiement

Ouvre l'adresse :

```text
/health
```

Si la page retourne `{"ok": true}`, le serveur fonctionne.

## Remarque importante sur SQLite

SQLite est acceptable pour une démonstration, un test ou une petite utilisation. Pour une entreprise avec plusieurs utilisateurs et données critiques, il faudra ensuite migrer vers PostgreSQL.


## Déploiement Dokploy

La méthode la plus fiable est le **Build Type Dockerfile** :

```text
Dockerfile Path: Dockerfile
Docker Context Path: .
Target Port: 8000
```

Variables recommandées :

```text
PORT=8000
DATA_DIR=/app/data
ADMIN_EMAIL=votre-email@entreprise.com
ADMIN_PASSWORD=un-mot-de-passe-fort
```

Montez un volume persistant sur `/app/data` afin de conserver la base SQLite.
Le fichier `DOKPLOY_DEPLOIEMENT.md` contient les étapes détaillées.
