# FundFlow — déploiement fiable

Cette version fonctionne avec Python standard et SQLite, sans Flask, Django,
Node.js, npm ni dépendance externe.

## Dokploy — méthode recommandée

Choisissez **Dockerfile** dans le type de build :

```text
Dockerfile Path : Dockerfile
Docker Context Path : .
Target Port : 8000
```

Ajoutez dans **Environment Variables** :

```text
PORT=8000
DATA_DIR=/app/data
ADMIN_EMAIL=votre-email@entreprise.com
ADMIN_PASSWORD=un-mot-de-passe-fort
SEED_DEMO_USERS=false
```

Créez un volume persistant monté dans le conteneur sur `/app/data`, sinon la
base SQLite peut être perdue lors d'un redéploiement.

Après le déploiement, ouvrez `/health`. La réponse doit contenir `"ok": true`.

## Dokploy — alternative Nixpacks

Le dépôt contient les fichiers nécessaires :

- `nixpacks.toml`
- `.python-version`
- `main.py`
- `Procfile`
- `requirements.txt`

Dans Dokploy, choisissez **Nixpacks**, laissez **Publish Directory** vide et
utilisez le port cible `8000`. Le démarrage est déjà fixé à `python main.py`.

## Premier administrateur

Le compte administrateur est créé au premier lancement à partir de
`ADMIN_EMAIL` et `ADMIN_PASSWORD`. Si `ADMIN_PASSWORD` n'est pas défini, un mot
de passe temporaire aléatoire est affiché une seule fois dans les logs Dokploy.

Les identifiants ne sont pas affichés sur la page de connexion.

## Test local

Windows : double-cliquez sur `LANCER_FUNDFLOW.bat`.

Linux/macOS :

```bash
python3 app.py
```
