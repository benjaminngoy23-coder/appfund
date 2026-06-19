"""Point d'entrée de compatibilité pour Nixpacks, Railpack et Dokploy."""
from app import run_server


if __name__ == "__main__":
    run_server(open_browser=False)
