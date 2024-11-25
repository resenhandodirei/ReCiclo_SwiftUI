//
//  HomeView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

// Modelo de Produto
struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let image: String
    let isFavorite: Bool
}

struct HomeeView: View {
    // Dados simulados
    @State private var products = [
        Product(name: "Mesa de Madeira", price: 200.00, image: "table", isFavorite: false),
        Product(name: "Sofá Retrátil", price: 1500.00, image: "sofa", isFavorite: true),
        Product(name: "Geladeira Branca", price: 800.00, image: "fridge", isFavorite: false),
        Product(name: "Cadeira Gamer", price: 400.00, image: "chair", isFavorite: true)
    ]
    @State private var searchQuery: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // Barra de Pesquisa
                HStack {
                    TextField("Buscar produtos...", text: $searchQuery)
                        .padding(10)
                        .background(Color("LightBeige"))
                        .cornerRadius(10)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        )
                        .padding(.horizontal)
                }

                // Feed de Produtos
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(filteredProducts) { product in
                            ProductCardView(product: product)
                        }
                    }
                    .padding()
                }
                .navigationTitle("ReCiclo")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("Acessar perfil do usuário.")
                        }) {
                            Image(systemName: "person.crop.circle")
                                .font(.title2)
                                .foregroundColor(Color("PrimaryGreen"))
                        }
                    }
                }
            }
            .background(Color("LightBeige").edgesIgnoringSafeArea(.all))
        }
    }

    // Filtragem de Produtos com Base na Pesquisa
    var filteredProducts: [Product] {
        if searchQuery.isEmpty {
            return products
        } else {
            return products.filter { $0.name.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
}

// Componente para o Cartão de Produto
struct ProductCardView: View {
    let product: Product

    var body: some View {
        VStack {
            // Imagem do Produto
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(10)

            // Informações do Produto
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(Color("PrimaryGreen"))
                    .lineLimit(1)

                Text("R$ \(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)

            // Botão de Favoritar
            HStack {
                Spacer()
                Button(action: {
                    print("\(product.name) foi favoritado/desfavoritado.")
                }) {
                    Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(product.isFavorite ? .red : .gray)
                }
            }
            .padding(.horizontal, 8)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

// Estrutura de Prévia
struct HomeeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeeView()
    }
}
