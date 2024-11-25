//
//  TransactionRatingView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct TransactionRatingView: View {
    @State private var rating: Int = 0
    @State private var comment: String = ""
    @State private var isSubmitted = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Avalie sua experiência")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Seção de Avaliação por Estrelas
                Text("Dê uma nota para a transação:")
                    .font(.headline)
                
                HStack {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: star <= rating ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(star <= rating ? .yellow : .gray)
                            .onTapGesture {
                                rating = star
                            }
                            .padding(.horizontal, 4)
                    }
                }
                
                // Campo de Comentário
                VStack(alignment: .leading) {
                    Text("Deixe um comentário:")
                        .font(.headline)
                    
                    TextEditor(text: $comment)
                        .frame(height: 150)
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                .padding(.horizontal)
                
                // Botão de Envio
                Button(action: submitRating) {
                    Text("Enviar Avaliação")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(rating > 0 ? Color.blue : Color.gray)
                        .cornerRadius(10)
                }
                .disabled(rating == 0)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Avaliação")
            .alert(isPresented: $isSubmitted) {
                Alert(
                    title: Text("Avaliação Enviada"),
                    message: Text("Obrigado por compartilhar sua experiência!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    // Ação ao Enviar Avaliação
    func submitRating() {
        // Simula o envio de dados para um backend ou banco de dados
        print("Avaliação Enviada")
        print("Nota: \(rating)")
        print("Comentário: \(comment)")
        isSubmitted = true
        resetForm()
    }
    
    // Reseta os campos após o envio
    func resetForm() {
        rating = 0
        comment = ""
    }
}

// Preview
struct TransactionRatingView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRatingView()
    }
}
