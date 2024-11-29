//
//  SplashView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            // Fundo com gradiente cobrindo toda a tela
            LinearGradient(
                gradient: Gradient(colors: [Color("greenSecondary"), Color("greenTertiary")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            if isActive {
                // Redireciona para a tela principal após o splash
                HomeView() // Substitua com a próxima tela do app
            } else {
                VStack {
                    Spacer()
                    
                    // Logo do aplicativo
                    Image(systemName: "leaf.fill") // Substitua pelo nome do seu logo
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color("bluePrimary")) // Azul sustentável
                    
                    // Nome do aplicativo
                    Text("ReCiclo")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("bluePrimary"))
                    
                    Spacer()
                    
                    // Texto de carregamento ou tagline
                    Text("Conectando pessoas e produtos com propósito")
                        .font(.subheadline)
                        .foregroundColor(Color("greenSecondary")) // Cinza escuro
                        .padding(.bottom, 20)
                }
            }
        }
        .onAppear {
            // Simula um carregamento antes de redirecionar
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("Bem-vindo ao ReCiclo!")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color("bluePrimary"))
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environment(\.colorScheme, .light)
    }
}

