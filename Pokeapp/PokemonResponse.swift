//
//  PokemonResponse.swift
//  Pokeapp
//
//  Created by etudiant on 19/01/2022.
//

import Foundation

struct PokemonType: Codable {
    let name: String?
}

struct PokemonTypes: Codable {
    let type: PokemonType?
}

struct PokemonSprite: Codable {
    let front_default: String?
    let front_shiny: String?
}

struct PokemonResponse: Codable {
    let id: Int?
    let name: String?
    let sprites: PokemonSprite?
    let types: [PokemonTypes]
    let height: Int?
    let weight: Int?
}

struct Pokemon {
    let id: Int?
    let name: String?
    let sprite: String?
    let types: String?
    let sprite_shiny: String?
    let height: Int?
    let weight: Int?
}
