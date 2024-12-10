//
//  TransactionHistoryView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 10/12/24.
//

import SwiftUI

// Modelo de Transação
struct Transaction: Identifiable {
    var id: Int
    var productName: String
    var price: String
    var status: String
    var transactionDate: String
}

struct TransactionHistoryView: View {
    @State private var transactions: [Transaction] = [
        Transaction(id: 1, productName: "iPhone 13", price: "$799", status: "Concluído", transactionDate: "01/12/2024"),
        Transaction(id: 2, productName: "MacBook Air", price: "$999", status: "Aguardando Pagamento", transactionDate: "05/12/2024"),
        Transaction(id: 3, productName: "AirPods Pro", price: "$249", status: "Cancelado", transactionDate: "10/12/2024")
    ]
    
    var body: some View {
        VStack {
            Text("Histórico de Transações")
                .font(.largeTitle)
                .bold()
                .padding()

            if transactions.isEmpty {
                Text("Você não tem transações.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(transactions) { transaction in
                    TransactionRow(transaction: transaction)
                }
            }
        }
        .navigationTitle("Histórico de Transações")
    }
}

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(transaction.productName)
                    .font(.headline)
                Spacer()
                Text(transaction.price)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            
            HStack {
                Text("Status: \(transaction.status)")
                    .font(.subheadline)
                    .foregroundColor(transaction.status == "Concluído" ? .green : .red)
                Spacer()
                Text(transaction.transactionDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionHistoryView()
        }
    }
}
