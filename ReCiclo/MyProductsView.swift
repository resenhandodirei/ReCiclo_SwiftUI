//
//  MyProductsView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct MyProductsView: View {
    // Mock Data
    @State private var activeProducts = [
        ProductItem(id: 1, name: "Bicicleta", price: 350.0, image: "bicycle"),
        ProductItem(id: 2, name: "Notebook Usado", price: 1200.0, image: "laptop")
    ]
    @State private var soldProducts = [
        ProductItem(id: 3, name: "Celular", price: 800.0, image: "iphone"),
        ProductItem(id: 4, name: "Livro de Ficção", price: 20.0, image: "book")
    ]
    
    init() {
        // Custom Tab Bar Appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        
        // Change selected and unselected item colors
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "greenSecondary")
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "greenSecondary") ?? .green]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            TabView {
                // Ativos
                ProductsListView(products: activeProducts, title: "Ativos")
                    .tabItem {
                        Label("Ativos", systemImage: "cart.fill")
                    }
                
                // Vendidos
                ProductsListView(products: soldProducts, title: "Vendidos")
                    .tabItem {
                        Label("Vendidos", systemImage: "checkmark.circle.fill")
                    }
            }
            .navigationTitle("Meus Produtos")
        }
    }
}

struct ProductsListView: View {
    let products: [ProductItem]
    let title: String
    
    var body: some View {
        VStack {
            if products.isEmpty {
                Text("Nenhum produto em \(title).")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(products) { product in
                    HStack {
                        // Product Image
                        Image(systemName: product.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .background(Color.greenSecondary.opacity(0.5))
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            // Product Name
                            Text(product.name)
                                .font(.headline)
                                .foregroundColor(.bluePrimary)
                            
                            // Product Price
                            Text("R$ \(product.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.greenTertiary)
                        }
                        
                        Spacer()
                        
                        // Action Icons
                        Button(action: {
                            // Edit Action
                            print("Edit \(product.name)")
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(.greenSecondary)
                        }
                        .padding(.trailing, 8)
                        
                        Button(action: {
                            // Delete Action
                            print("Delete \(product.name)")
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.bluePrimary)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
        }
    }
}

// Model
struct ProductItem: Identifiable {
    let id: Int
    let name: String
    let price: Double
    let image: String
}

// Preview
struct MyProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MyProductsView()
    }
}
