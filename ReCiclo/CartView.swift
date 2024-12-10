//
//  CartView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct CartView: View {
    // Mock Data
    @State private var cartItems = [
        CartItem(id: 1, name: "Cadeira de Escritório", price: 450.0, quantity: 1, image: "chair"),
        CartItem(id: 2, name: "Monitor 24''", price: 750.0, quantity: 2, image: "desktopcomputer"),
        CartItem(id: 3, name: "Mochila Escolar", price: 120.0, quantity: 1, image: "bag")
    ]
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if cartItems.isEmpty {
                    Text("Seu carrinho está vazio.")
                        .font(.headline)
                        .foregroundColor(.greenTertiary)
                        .padding()
                } else {
                    List {
                        ForEach($cartItems) { $item in
                            HStack {
                                // Product Image
                                Image(systemName: item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .background(Color.greenTertiary.opacity(0.2))
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    // Product Name
                                    Text(item.name)
                                        .font(.headline)
                                        .foregroundColor(.greenTertiary)
                                    
                                    // Product Price
                                    Text("R$ \(item.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.greenSecondary)
                                }
                                Spacer()
                                
                                // Quantity Adjuster
                                HStack {
                                    Button(action: {
                                        if item.quantity > 1 {
                                            item.quantity -= 1
                                        }
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.red)
                                    }
                                    
                                    Text("\(item.quantity)")
                                        .font(.body)
                                        .frame(width: 30, alignment: .center)
                                    
                                    Button(action: {
                                        item.quantity += 1
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteItem)
                    }
                    
                    // Total and Checkout Button
                    VStack {
                        HStack {
                            Text("Total:")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Text("R$ \(totalPrice, specifier: "%.2f")")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.greenSecondary)
                        }
                        .padding()
                        
                        Button(action: {
                            // Checkout Action
                            print("Finalizando compra...")
                        }) {
                            Text("Finalizar Compra")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.greenTertiary)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitle("Carinho", displayMode: .inline)
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
    }
}

// Model
struct CartItem: Identifiable {
    let id: Int
    let name: String
    let price: Double
    var quantity: Int
    let image: String
}

// Preview
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
