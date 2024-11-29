//
//  NotificationsView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct NotificationsView: View {
    @State private var notifications: [NotificationItem] = [
        NotificationItem(id: 1, title: "Nova Mensagem", description: "Você recebeu uma mensagem de João Silva.", time: "5 min atrás", type: .message),
        NotificationItem(id: 2, title: "Mudança de Preço", description: "O preço do item 'Cadeira de Escritório' foi alterado para R$150.", time: "2 horas atrás", type: .priceChange),
        NotificationItem(id: 3, title: "Promoção!", description: "Aproveite 20% de desconto nos itens da categoria 'Móveis'.", time: "Ontem", type: .promotion),
        NotificationItem(id: 4, title: "Status da Transação", description: "Sua compra do 'Notebook Dell' foi concluída com sucesso.", time: "2 dias atrás", type: .transaction)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notifications) { notification in
                    NotificationRow(notification: notification)
                }
                .onDelete(perform: deleteNotification)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Notificações")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: clearNotifications) {
                        Text("Limpar Tudo")
                            .foregroundColor(.greenSecondary)
                    }
                }
            }
        }
    }
    
    // Função para deletar uma notificação
    private func deleteNotification(at offsets: IndexSet) {
        notifications.remove(atOffsets: offsets)
    }
    
    // Função para limpar todas as notificações
    private func clearNotifications() {
        notifications.removeAll()
    }
}

// Modelo de notificação
struct NotificationItem: Identifiable {
    let id: Int
    let title: String
    let description: String
    let time: String
    let type: NotificationType
}

// Tipos de notificações
enum NotificationType {
    case message, priceChange, promotion, transaction
}

// Row para exibir cada notificação
struct NotificationRow: View {
    let notification: NotificationItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            IconView(type: notification.type)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.title)
                    .font(.headline)
                    .foregroundColor(.bluePrimary)
                Text(notification.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                Text(notification.time)
                    .font(.caption)
                    .foregroundColor(.greenTertiary)
            }
        }
        .padding(.vertical, 8)
    }
}

// Exibição do ícone de cada tipo de notificação
struct IconView: View {
    let type: NotificationType
    
    var body: some View {
        Circle()
            .fill(Color("greenTertiary")) // Define a cor como greenTertiary
            .frame(width: 40, height: 40)
            .overlay(
                Image(systemName: iconForType(type))
                    .foregroundColor(.white)
            )
    }
    
    private func iconForType(_ type: NotificationType) -> String {
        switch type {
        case .message: return "message.fill"
        case .priceChange: return "tag.fill"
        case .promotion: return "star.fill"
        case .transaction: return "checkmark.circle.fill"
        }
    }
}

// Preview
struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

