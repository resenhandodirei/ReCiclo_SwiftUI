//
//  ChatView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messages: [Message] = [
        Message(id: 1, text: "Olá, o item ainda está disponível?", isSender: true, timestamp: "10:15 AM"),
        Message(id: 2, text: "Sim, está disponível!", isSender: false, timestamp: "10:16 AM"),
        Message(id: 3, text: "Pode me dar mais detalhes sobre o produto?", isSender: true, timestamp: "10:17 AM")
    ]
    @State private var newMessage = ""
    
    var body: some View {
        VStack {
            // Lista de mensagens
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(messages) { message in
                            HStack {
                                if message.isSender {
                                    Spacer()
                                    ChatBubble(text: message.text, isSender: true)
                                } else {
                                    ChatBubble(text: message.text, isSender: false)
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        }
                    }
                }
                .onAppear {
                    scrollToLastMessage(proxy: proxy)
                }
                .onChange(of: messages) { _ in
                    scrollToLastMessage(proxy: proxy)
                }
            }
            
            // Campo de entrada de mensagem
            HStack {
                TextField("Digite sua mensagem...", text: $newMessage)
                    .padding(10)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .padding(10)
                        .background(Color.blue.opacity(0.2))
                        .clipShape(Circle())
                }
                .disabled(newMessage.isEmpty)
            }
            .padding()
        }
        .navigationTitle("Chat")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Função para enviar mensagem
    private func sendMessage() {
        guard !newMessage.isEmpty else { return }
        let newMsg = Message(
            id: messages.count + 1,
            text: newMessage,
            isSender: true,
            timestamp: Date().formatted(.dateTime.hour().minute())
        )
        messages.append(newMsg)
        newMessage = ""
    }
    
    // Função para rolar até a última mensagem
    private func scrollToLastMessage(proxy: ScrollViewProxy) {
        if let lastMessage = messages.last {
            withAnimation {
                proxy.scrollTo(lastMessage.id, anchor: .bottom)
            }
        }
    }
}

// Modelo para mensagens com conformidade do protocolo Equatable
struct Message: Identifiable, Equatable {
    let id: Int
    let text: String
    let isSender: Bool
    let timestamp: String
    
    // Implementação do operador de comparação
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id &&
               lhs.text == rhs.text &&
               lhs.isSender == rhs.isSender &&
               lhs.timestamp == rhs.timestamp
    }
}

// Bubble de mensagem
struct ChatBubble: View {
    let text: String
    let isSender: Bool
    
    var body: some View {
        Text(text)
            .padding()
            .foregroundColor(isSender ? .white : .black)
            .background(isSender ? Color.blue : Color(UIColor.systemGray4))
            .cornerRadius(15)
            .frame(maxWidth: 250, alignment: isSender ? .trailing : .leading)
    }
}

// Preview
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView()
        }
    }
}
