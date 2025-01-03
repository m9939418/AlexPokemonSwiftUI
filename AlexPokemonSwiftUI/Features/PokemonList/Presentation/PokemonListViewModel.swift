//
// PokemonListViewModel.swift
// AlexPokemonSwiftUI
//
// Created by AlexYang on 2024/12/31.
//


import Foundation

final class PokemonListViewModel: ObservableObject {
    private let pokemonManager  = PokemonManager()
    
    @Published var pokemonoList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    // Used with searchText to filter pokemon results
    var filterPokemons: [Pokemon] {
        return searchText == "" ? pokemonoList : pokemonoList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemonoList = pokemonManager.fetchPokemon()
    }
    
    // Get the index of a pokemon ( index + 1 = pokemon id)
    func getPokemonIndex(pokemon: Pokemon) -> Int{
        if let index = self.pokemonoList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    // Get specific details for a pokemon
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0)
        
        pokemonManager.getDetailPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }

    // Formats the Height or the Weight of a given pokemon
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%0.2f", dValue / 10)
        return string
    }
    
}
