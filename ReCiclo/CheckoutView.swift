//
//  CheckoutView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct CheckoutView: View {
    // Mock Data
    @State private var selectedPaymentMethod = "Cartão de Crédito"
    @State private var address = "Rua Exemplo, 123, Centro, Cidade, Estado"
    @State private var isOrderConfirmed = false
    
    let paymentMethods = ["Cartão de Crédito", "Cartão de Débito", "Pix", "Boleto Bancário"]
    let totalAmount: Double = 1370.00 // Mock total value
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Shipping Address
                VStack(alignment: .leading, spacing: 10) {
                    Text("Endereço de Envio")
                        .font(.headline)
                        .foregroundColor(.greenTertiary)
                    
                    Text(address)
                        .font(.body)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.greenTertiary.opacity(0.2))
                        .cornerRadius(8)
                    
                    Button(action: {
                        // Action to edit address
                        print("Editando endereço...")
                    }) {
                        Text("Editar Endereço")
                            .font(.subheadline)
                            .foregroundColor(.bluePrimary)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                // Payment Methods
                VStack(alignment: .leading, spacing: 10) {
                    Text("Método de Pagamento")
                        .font(.headline)
                    
                    Picker("Método de Pagamento", selection: $selectedPaymentMethod) {
                        ForEach(paymentMethods, id: \.self) { method in
                            Text(method).tag(method)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)
                
                Divider()
                
                // Order Summary
                VStack(alignment: .leading, spacing: 10) {
                    Text("Resumo do Pedido")
                        .font(.headline)
                    
                    HStack {
                        Text("Total:")
                            .font(.title2)
                        Spacer()
                        Text("R$ \(totalAmount, specifier: "%.2f")")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.greenTertiary)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Confirm Order Button
                Button(action: {
                    isOrderConfirmed = true
                }) {
                    Text("Finalizar Compra")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.bluePrimary)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .navigationTitle("Checkout")
            .alert(isPresented: $isOrderConfirmed) {
                Alert(
                    title: Text("Pedido Confirmado"),
                    message: Text("Sua compra foi finalizada com sucesso!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

// Preview
struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
