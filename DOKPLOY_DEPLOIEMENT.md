# Déploiement FundFlow sur Dokploy

## Configuration recommandée : Dockerfile

Dans Dokploy :

1. **Build Type** : `Dockerfile`
2. **Dockerfile Path** : `Dockerfile`
3. **Docker Context Path** : `.`
4. **Target Port du domaine** : `8000`
5. Ajouter les variables d'environnement :

```text
PORT=8000
DATA_DIR=/app/data
ADMIN_EMAIL=votre-email@entreprise.com
ADMIN_PASSWORD=un-mot-de-passe-fort
```

6. Pour garder la base après un redéploiement, créer un volume persistant :

```text
Chemin dans le conteneur : /app/data
```

7. Déployer puis vérifier :

```text
https://votre-domaine/health
```

La réponse attendue contient `"ok": true`.

## Si vous gardez Nixpacks

Le dépôt contient maintenant `nixpacks.toml`, `.python-version`, `main.py` et un
`Procfile`. Dans Dokploy :

- **Build Type** : `Nixpacks`
- **Publish Directory** : laisser vide
- **Target Port** : `8000`
- **Start Command personnalisé** : laisser vide, ou utiliser `python main.py`

Ne renseignez pas une commande Node.js, npm, gunicorn ou Django : cette version
est une application Python autonome.
