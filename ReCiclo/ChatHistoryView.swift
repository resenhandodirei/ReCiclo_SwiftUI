//
//  ChatHistoryView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct ChatHistoryView: View {
    @State private var chats: [Chat] = [
        Chat(id: 1, name: "João Silva", lastMessage: "Sim, ainda está disponível.", timestamp: "10:15 AM", isUnread: true),
        Chat(id: 2, name: "Maria Oliveira", lastMessage: "Obrigado pela ajuda!", timestamp: "Ontem", isUnread: false),
        Chat(id: 3, name: "Carlos Santos", lastMessage: "Podemos combinar amanhã?", timestamp: "2 dias atrás", isUnread: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(chats) { chat in
                    NavigationLink(destination: ChatView()) {
                        ChatRow(chat: chat)
                    }
                }
                .onDelete(perform: deleteChat)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Mensagens")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: newChat) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    // Função para deletar um chat
    private func deleteChat(at offsets: IndexSet) {
        chats.remove(atOffsets: offsets)
    }
    
    // Função para iniciar um novo chat
    private func newChat() {
        // Lógica para criar uma nova conversa
        print("Iniciar novo chat")
    }
}

// Modelo de chat
struct Chat: Identifiable {
    let id: Int
    let name: String
    let lastMessage: String
    let timestamp: String
    let isUnread: Bool
}

// Row para exibir informações de cada chat
struct ChatRow: View {
    let chat: Chat
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .overlay(
                    Text(chat.name.prefix(1))
                        .foregroundColor(.white)
                        .font(.title2)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(chat.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(chat.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(chat.timestamp)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if chat.isUnread {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

// Preview
struct ChatHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHistoryView()
    }
}
