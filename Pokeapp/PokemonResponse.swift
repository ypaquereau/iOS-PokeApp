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
}

struct PokemonResponse: Codable {
    let name: String?
    let sprites: PokemonSprite?
    let types: [PokemonTypes]
    
}

struct Pokemon: Codable {
    let name: String?
    let sprites: String?
    let types: String?
}
