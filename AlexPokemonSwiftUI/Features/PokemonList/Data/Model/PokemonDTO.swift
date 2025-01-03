//
// PokemonDTO.swift
// AlexPokemonSwiftUI
//
// Created by AlexYang on 2024/12/31.
//


import Foundation

struct PokemonDTO: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Identifiable, Codable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var smapleData = Pokemon(
        name: "bulbasaur",
        url: "https://pokeapi.co/api/v2/pokemon/1/"
    )
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
