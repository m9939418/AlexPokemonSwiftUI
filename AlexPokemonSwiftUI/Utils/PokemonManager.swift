//
// PokemonManager.swift
// AlexPokemonSwiftUI
//
// Created by AlexYang on 2024/12/31.
//


import Foundation

class PokemonManager {
    
    func fetchPokemon() -> [Pokemon] {
        let data: PokemonDTO = Bundle.main.decode(file: "pokemon.json")
        let pokemons: [Pokemon] = data.results
        return pokemons
    }
    
    func getDetailPokemon(id: Int, completetion: @escaping (DetailPokemon) -> ()) {
        Bundle.main.fetchData(
            url: "https://pokeapi.co/api/v2/pokemon/\(id)/",
            model: DetailPokemon.self) { data in
            completetion(data)
        } failure: { error in
            print(error)
        }
    }
}
