//
//  ProductDetailsView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct ProductDetailsView: View {
    // Mock data
    let productName = "Cadeira de Escritório"
    let productPrice = "R$ 250,00"
    let productDescription = "Cadeira ergonômica com ajuste de altura e encosto reclinável. Perfeita para home office!"
    let productLocation = "São Paulo, SP"
    let productImages = ["chair1", "chair2", "chair3"] // Substitua pelos nomes reais das imagens no seu projeto
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // Galeria de imagens
                    TabView {
                        ForEach(productImages, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 300)
                                .clipped()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 300)
                    
                    // Informações do Produto
                    VStack(alignment: .leading, spacing: 16) {
                        Text(productName)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(productPrice)
                            .font(.title2)
                            .foregroundColor(.greenTertiary)
                        
                        Text("Descrição")
                            .font(.headline)
                        
                        Text(productDescription)
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        Text("Localização")
                            .font(.headline)
                        
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.greenSecondary)
                            Text(productLocation)
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Botão para iniciar chat
                    Button(action: {
                        startChat()
                    }) {
                        HStack {
                            Image(systemName: "message.fill")
                            Text("Iniciar Chat")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.bluePrimary)
                        .cornerRadius(10)
                    }
                    .padding([.leading, .trailing, .bottom])
                }
            }
            
            // Botões flutuantes no centro
            VStack {
                Spacer()
                
                HStack(spacing: 40) {
                    // Botão de Dislike
                    FloatingButton(icon: "xmark", color: .greenTertiary) {
                        print("Produto rejeitado.")
                    }
                    
                    // Botão de Like
                    FloatingButton(icon: "heart.fill", color: .greenSecondary) {
                        print("Produto curtido.")
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Detalhes do Produto")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Função simulada para iniciar chat
    private func startChat() {
        print("Iniciando chat com o vendedor...")
    }
}

// Botão flutuante reutilizável
struct FloatingButton: View {
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(color)
                .clipShape(Circle())
                .shadow(color: color.opacity(0.6), radius: 5, x: 0, y: 4)
        }
    }
}

// Preview
struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}

