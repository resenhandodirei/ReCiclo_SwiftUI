//
//  PurchaseConfirmationView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct PurchaseConfirmationView: View {
    // Mock Data
    let purchasedItems = [
        ("Produto A", 1, 599.99),
        ("Produto B", 2, 199.50)
    ]
    let shippingAddress = "Rua Exemplo, 123, Centro, Cidade, Estado"
    let totalPaid: Double = 998.99
    let estimatedDeliveryDate = "25 de Novembro, 2024"
    
    var body: some View {
        VStack(spacing: 20) {
            // Confirmation Icon
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.greenTertiary)
                Text("Compra Confirmada!")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.top, 40)
            
            // Summary Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Resumo da Compra")
                    .font(.headline)
                
                ForEach(purchasedItems, id: \.0) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.0)
                                .font(.body)
                                .fontWeight(.semibold)
                            Text("Quantidade: \(item.1)")
                                .font(.subheadline)
                                .foregroundColor(.greenTertiary)
                        }
                        Spacer()
                        Text("R$ \(item.2, specifier: "%.2f")")
                            .font(.body)
                    }
                }
                
                Divider()
                
                HStack {
                    Text("Total Pago:")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Text("R$ \(totalPaid, specifier: "%.2f")")
                        .font(.title3)
                        .foregroundColor(.greenSecondary)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            // Shipping Details
            VStack(alignment: .leading, spacing: 10) {
                Text("Endereço de Envio")
                    .font(.headline)
                Text(shippingAddress)
                    .font(.body)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.greenTertiary.opacity(0.2))
                    .cornerRadius(8)
                
                Text("Previsão de Entrega: \(estimatedDeliveryDate)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Continue Shopping Button
            Button(action: {
                // Navigate back to home or explore products
                print("Continuar comprando...")
            }) {
                Text("Continuar Comprando")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.bluePrimary)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Confirmação")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Preview
struct PurchaseConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PurchaseConfirmationView()
        }
    }
}
