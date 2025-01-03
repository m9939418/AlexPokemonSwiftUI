//
// PokemonView.swift
// AlexPokemonSwiftUI
//
// Created by AlexYang on 2025/1/2.
//


import SwiftUI
import Kingfisher

struct PokemonItemView: View {
    @EnvironmentObject var viewModel: PokemonListViewModel
    let pokemon: Pokemon
    let dimens: Double = 140
    
    var body: some View {
        VStack {
            KFImage(URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(viewModel.getPokemonIndex(pokemon: pokemon)).png"))
                .placeholder{
                    ProgressView()
                        .frame(width: dimens, height: dimens)
                }
                .resizable()
                .scaledToFill()
                .frame(width: dimens, height: dimens)
                .background(.thinMaterial)
                .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design:  .monospaced))
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    PokemonItemView(pokemon: Pokemon.smapleData)
        .environmentObject(PokemonListViewModel())
}
