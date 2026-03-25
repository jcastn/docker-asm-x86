# Nom du fichier source par défaut (sans l'extension .asm)
SRC ?= a64

# Régle pour supprimer et exécuter
all: $(SRC)
	rm -f $(SRC).o
	./$(SRC)

# Règle de compilation
$(SRC): $(SRC).o
	ld $(SRC).o -o $(SRC)

# Règle de création du fichier objet
$(SRC).o: $(SRC).asm
	nasm -f elf64 $(SRC).asm -o $(SRC).o

