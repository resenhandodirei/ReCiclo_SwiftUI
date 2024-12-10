//
//  PurchaseHistoryView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 10/12/24.
//

import SwiftUI

// Modelo de Compra
struct Purchase: Identifiable {
    var id: Int
    var productName: String
    var price: String
    var purchaseDate: String
    var status: String
}

struct PurchaseHistoryView: View {
    @State private var purchases: [Purchase] = [
        Purchase(id: 1, productName: "iPhone 13", price: "$799", purchaseDate: "2024-11-12", status: "Entregue"),
        Purchase(id: 2, productName: "MacBook Air", price: "$999", purchaseDate: "2024-10-15", status: "Em Trânsito"),
        Purchase(id: 3, productName: "AirPods Pro", price: "$249", purchaseDate: "2024-09-20", status: "Entregue")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Histórico de Compras")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                if purchases.isEmpty {
                    Text("Você ainda não fez nenhuma compra.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    // Lista de compras
                    List(purchases) { purchase in
                        PurchaseRow(purchase: purchase)
                    }
                    .listStyle(GroupedListStyle())
                }
            }
            .navigationTitle("Histórico de Compras")
        }
    }
}

struct PurchaseRow: View {
    var purchase: Purchase
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(purchase.productName)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Preço: \(purchase.price)")
                    .font(.subheadline)
                    .foregroundColor(.green)
                Text("Data: \(purchase.purchaseDate)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Status: \(purchase.status)")
                    .font(.subheadline)
                    .foregroundColor(purchase.status == "Entregue" ? .green : .orange)
            }
            
            Spacer()
        }
        .padding()
    }
}

// Preview
struct PurchaseHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PurchaseHistoryView()
        }
    }
}
