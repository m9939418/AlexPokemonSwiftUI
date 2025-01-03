//
// ContentView.swift
// AlexPokemonSwiftUI
//
// Created by AlexYang on 2024/12/31.
//


import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(viewModel.filterPokemons) { item in
                        NavigationLink(destination: PokemonDetailView(pokemon: item)) {
                            PokemonItemView(pokemon: item)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: viewModel.filterPokemons.count)
                .navigationTitle("Pokemon")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $viewModel.searchText)
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    PokemonListView()
}
