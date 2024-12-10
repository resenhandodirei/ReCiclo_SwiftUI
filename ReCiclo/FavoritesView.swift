//
//  FavoritesView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct FavoritesView: View {
    @State private var favoriteItems: [FavoriteItem] = [
        FavoriteItem(id: 1, name: "Smartphone", price: 1500.00, image: "phone.fill"),
        FavoriteItem(id: 2, name: "Cadeira Gamer", price: 800.00, image: "chair.fill"),
        FavoriteItem(id: 3, name: "Notebook", price: 3500.00, image: "laptopcomputer")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                if favoriteItems.isEmpty {
                    // Mensagem para lista vazia
                    Text("Sua lista de favoritos está vazia.")
                        .font(.headline)
                        .foregroundColor(.bluePrimary)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    // Lista de itens favoritos
                    List {
                        ForEach(favoriteItems) { item in
                            HStack {
                                Image(systemName: item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.greenTertiary)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(String(format: "R$ %.2f", item.price))
                                        .font(.subheadline)
                                        .foregroundColor(.greenSecondary)
                                }
                                Spacer()
                                
                                // Botão de remover dos favoritos
                                Button(action: {
                                    removeFromFavorites(item: item)
                                }) {
                                    Image(systemName: "heart.slash.fill")
                                        .foregroundColor(.greenTertiary)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
            .navigationBarTitle("Favoritos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: clearFavorites) {
                        Text("Limpar Tudo")
                            .foregroundColor(.greenTertiary)
                    }
                    .disabled(favoriteItems.isEmpty)
                }
            }
        }
    }
    
    // Função para remover um item dos favoritos
    private func removeFromFavorites(item: FavoriteItem) {
        withAnimation {
            favoriteItems.removeAll { $0.id == item.id }
        }
    }
    
    // Função para limpar todos os favoritos
    private func clearFavorites() {
        withAnimation {
            favoriteItems.removeAll()
        }
    }
}

// Modelo para item favorito
struct FavoriteItem: Identifiable {
    let id: Int
    let name: String
    let price: Double
    let image: String
}

// Preview
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
