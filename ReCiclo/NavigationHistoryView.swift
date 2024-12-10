//
//  NavigationHistoryView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 10/12/24.
//

import SwiftUI

struct NavigationHistoryView: View {
    
    // Lista de produtos visualizados
    let viewedProducts: [AppProduct] = [
        AppProduct(id: 1, name: "Camiseta Estampada", price: 49.99, image: "tshirt"),
        AppProduct(id: 2, name: "Tênis Running", price: 129.99, image: "sneakers"),
        AppProduct(id: 3, name: "Relógio Digital", price: 199.99, image: "watch")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Lista de produtos visualizados recentemente
                List(viewedProducts) { product in
                    HStack {
                        // Imagem do produto
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        // Nome e preço do produto
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)
                                .foregroundColor(.bluePrimary)
                            Text("R$ \(product.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.greenSecondary)
                        }
                        
                        Spacer()
                        
                        // Navegação para os detalhes do produto
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            Text("Ver Detalhes")
                                .font(.subheadline)
                                .foregroundColor(.greenTertiary)
                        }.padding(.horizontal, 30)
                    }
                    .padding()
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationBarTitle("Histórico de navegação", displayMode: .inline)
//            .navigationBarHidden(true)
        }
    }
}

// Modelo de Produto
struct AppProduct: Identifiable {
    let id: Int
    let name: String
    let price: Double
    let image: String
}

// Tela de Detalhes do Produto
struct ProductDetailView: View {
    var product: AppProduct
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
            
            Text(product.name)
                .font(.title)
                .padding()
            
            Text("R$ \(product.price, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Detalhes", displayMode: .inline)
    }
}

struct NavigationHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationHistoryView()
    }
}
