////
////  ConfirmationView.swift
////  ReCiclo
////
////  Created by Larissa Martins Correa on 10/12/24.
////
//
//import SwiftUI
//
//// Modelo de Produto
//struct Product: Identifiable {
//    var id: Int
//    var name: String
//    var price: Double
//    var quantity: Int
//}
//
//struct ConfirmationView: View {
//    @State private var purchasedItems: [Product] = [
//        Product(id: 1, name: "iPhone 13", price: 799.0, quantity: 1),
//        Product(id: 2, name: "MacBook Air", price: 999.0, quantity: 1),
//        Product(id: 3, name: "AirPods Pro", price: 249.0, quantity: 2)
//    ]
//    
//    var totalAmount: Double {
//        purchasedItems.reduce(0) { $0 + $1.price * Double($1.quantity) }
//    }
//    
//    var shippingAddress: String = "Rua Exemplo, 123, Cidade Exemplo, SP"
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Compra Confirmada!")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding()
//                
//                // Exibe itens comprados
//                List {
//                    ForEach(purchasedItems) { item in
//                        HStack {
//                            Text(item.name)
//                                .font(.headline)
//                            Spacer()
//                            Text("x\(item.quantity)")
//                                .foregroundColor(.gray)
//                            Spacer()
//                            Text("$\(item.price, specifier: "%.2f")")
//                                .foregroundColor(.green)
//                        }
//                    }
//                }
//                .listStyle(GroupedListStyle())
//                
//                // Exibe total pago
//                VStack {
//                    HStack {
//                        Text("Total Pago:")
//                            .font(.headline)
//                        Spacer()
//                        Text("$\(totalAmount, specifier: "%.2f")")
//                            .font(.headline)
//                            .foregroundColor(.green)
//                    }
//                    .padding()
//                    
//                    // Exibe endereço de envio
//                    HStack {
//                        Text("Endereço de Envio:")
//                            .font(.headline)
//                        Spacer()
//                        Text(shippingAddress)
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                    .padding()
//                }
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(radius: 5)
//                
//                // Botão de continuar comprando
//                NavigationLink(destination: ContentView()) {
//                    Text("Continuar Comprando")
//                        .font(.title2)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//            }
//            .navigationBarHidden(true) // Esconde a barra de navegação
//        }
//    }
//}
//
//// Tela inicial (ContentView) - Simples exemplo de navegação
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Bem-vindo à loja!")
//                .font(.largeTitle)
//                .padding()
//            NavigationLink(destination: ConfirmationView()) {
//                Text("Ir para Confirmação de Compra")
//                    .font(.title2)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//        }
//        .navigationBarHidden(true)
//    }
//}
//
//// Preview
//struct ConfirmationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmationView()
//    }
//}
