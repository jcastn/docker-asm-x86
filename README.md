# docker-asm-x86
Un **conteneur Docker sous Ubuntu AMD-64** pour compiler et exécuter du code en langage d'assembleur x86 sur un Mac (avec puce Apple Silicon ARM-64). 

Il contient plusieurs outils utiles à la programmation en assembleur : 
- `nasm` : Le logiciel pour assembler le code source (en langage d'assembleur) en un fichier objet.
- `binutils`: Le logiciel contenant l'outil ld qui servira à lier le fichier objet en un fichier exécutable.
- `make` : Le logiciel qui automatise le processus de compilation.
- `nano` / `vim` / `gdb` / `gcc` / `strace` : Différents outils qui seront utiles pour éditer et débugger des fichiers.

🐳 L'image du conteneur est aussi hebergée sur [DockerHub](https://hub.docker.com/r/julienmorue/asm-lab)


# Création et démarrage du conteneur 

Pour créer le conteneur, deux méthodes coexistent : 

### 1. Installation manuelle
On glisse tous les fichiers (Makefile + Dockerfile) dans un dossier local et on crée et démarre le conteneur manuellement.
  - créer l'image du conteneur : `docker buildx build --platform linux/amd64 -t asm-lab --load /chemin/vers/conteneur`
  - lancer le conteneur : `docker run -it --platform linux/amd64 --privileged -v /chemin/vers/conteneur:/app -w /app asm-lab bash`

### 2. Installation via DockerHub
Démarrer le cotneneur à partir de l'image du conteneur se trouvant sur [DockerHub](https://hub.docker.com/r/julienmorue/asm-lab)
  - obtenir l'image (optionnel) : `docker pull julienmorue/asm-lab:latest`
  - lancer le conteneur : `docker run -it --platform linux/amd64 --privileged -v /chemin/vers/conteneur:/app -w /app julienmorue/asm-lab:latest bash`


---
## Makefile 
Dans le conteneur, la commande `make` permet d'assembler, lier et exécuter un fichier .asm : 
 - S'il s'appelle "a64.asm" : `make`
 - S'il a un autre nom : `make SRC=nom_fichier` (sans marquer l'extension.asm)
(le fichier objet intermédiaire (`.o`) est automatiquement supprimé)

L'éxecutable obtenu peut ensuite être exécuté avec : `./nom_fichier`
