//
// PokemonDetailView.swift
// AlexPokemonSwiftUI
//
// Created by AlexYang on 2025/1/2.
//


import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: PokemonListViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonItemView(pokemon: pokemon)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("ID: \(viewModel.pokemonDetails?.id ?? 0)")
                Text("Weight: \(viewModel.formatHW(value: viewModel.pokemonDetails?.weight ?? 0)) KG")
                Text("Height: \(viewModel.formatHW(value: viewModel.pokemonDetails?.height ?? 0)) CM")
            }
        }
        .onAppear {
            viewModel.getDetails(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.smapleData)
        .environmentObject(PokemonListViewModel())
}
