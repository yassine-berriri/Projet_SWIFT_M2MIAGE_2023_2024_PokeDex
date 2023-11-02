//
//  Data.swift
//  PokeDex
//
//  Created by user246016 on 10/31/23.
//

import Foundation

struct PokemonType: Codable {
    let name: String
    let url: String
}

struct Pokedex: Codable {
    let count: Int
    let next, previous: String?
    let results: [PokemonType]
}
// le struct de pokemon
struct Pokedex3: Codable {
    let name: String
    let weight: Int
    let baseExperience: Int?
    let order: Int
    let sprites: Sprites
}

struct Sprites: Codable {
    let versions: Versions
}

struct Versions: Codable {
    let generationViii: GenerationViii

    enum CodingKeys: String, CodingKey {
        case generationViii = "generation-viii"
    }
}

struct GenerationViii: Codable {
    let icons: Icons
}

struct Icons: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
//le struct de type de pokemon
struct Pokedex2: Codable {
    let damageRelations: DamageRelations
    let gameIndices: [GameIndex]
    let generation: Generation
    let id: Int
    let moveDamageClass: Generation
    let moves: [Generation]
    let name: String
    let names: [Name]
    let pastDamageRelations: [String]
    let pokemon: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case gameIndices = "game_indices"
        case generation, id
        case moveDamageClass = "move_damage_class"
        case moves, name, names
        case pastDamageRelations = "past_damage_relations"
        case pokemon
    }
}

// MARK: - DamageRelations
struct DamageRelations: Codable {
    let doubleDamageFrom: [Generation]
    let doubleDamageTo: [Generation]
    let halfDamageFrom: [Generation]
    let halfDamageTo, noDamageFrom, noDamageTo: [Generation]

    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamageTo = "double_damage_to"
        case halfDamageFrom = "half_damage_from"
        case halfDamageTo = "half_damage_to"
        case noDamageFrom = "no_damage_from"
        case noDamageTo = "no_damage_to"
    }
}

// MARK: - Generation
struct Generation: Codable {
    let name: String
    let url: String
}

// MARK: - GameIndex
struct GameIndex: Codable {
    let gameIndex: Int
    let generation: Generation

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
    }
}

// MARK: - Name
struct Name: Codable {
    let language: Generation
    let name: String
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let pokemon: Generation
    let slot: Int
}
