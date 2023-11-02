# Projet_SWIFT_M2MIAGE_2023_2024_PokeDex

## Aperçu
L'application "PokeDex" est une application iOS qui utilise l'API PokeAPI pour présenter une liste de types de Pokemon, les Pokemons associés à ces types, ainsi que des informations détaillées sur chaque Pokemon.

## Fonctionnalités

L'application propose les fonctionnalités suivantes :

Deux onglets principaux :

Liste des Types de Pokemon : Affiche la liste des types de Pokemon disponibles, permettant aux utilisateurs de sélectionner un type.
Écran "A propos" : Présente des informations sur l'application, y compris un logo Pokemon.
Liste des Pokemons par Type : Lorsqu'un type est sélectionné, l'application affiche une liste des Pokemons associés à ce type.

Détails des Pokemons : Lorsque l'utilisateur clique sur un Pokemon dans la liste, l'application affiche des informations détaillées sur ce Pokemon, y compris une image.

Appels API : L'application effectue des appels API GET pour récupérer les données sur les types de Pokemon, les Pokemons associés à un type particulier, ainsi que des informations détaillées sur chaque Pokemon.

Conception soignée : Le projet comprend une conception simple mais soignée, avec une UIImageView et une utilisation appropriée des contraintes Auto-Layout.

## Configuration de l'API

- Pour les types de Pokemon : https://pokeapi.co/api/v2/type
- Pour les Pokemons d'un type : https://pokeapi.co/api/v2/type/{TYPE_ID}
- Pour les détails d'un Pokemon : https://pokeapi.co/api/v2/pokemon/{POKEMON_ID}
