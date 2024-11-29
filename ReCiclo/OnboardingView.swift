//
//  OnboardingView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0

    var body: some View {
        VStack {
            // Pager para as páginas de onboarding
            TabView(selection: $currentPage) {
                // Página 1
                OnboardingPageView(
                    imageName: "leaf.fill", // Substitua pelo ícone relacionado
                    title: "Sustentabilidade",
                    description: "Conecte-se a produtos que promovem um mundo mais sustentável."
                )
                .tag(0)
                
                // Página 2
                OnboardingPageView(
                    imageName: "magnifyingglass.circle.fill",
                    title: "Encontre o que você precisa",
                    description: "Pesquise itens de segunda mão com facilidade."
                )
                .tag(1)
                
                // Página 3
                OnboardingPageView(
                    imageName: "message.fill",
                    title: "Negocie diretamente",
                    description: "Converse com vendedores e compre de forma segura."
                )
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            // Botão "Próximo" ou "Começar"
            Button(action: {
                if currentPage < 2 {
                    currentPage += 1
                } else {
                    // Ação ao finalizar o onboarding
                    print("Onboarding concluído!") // Substitua pela navegação
                }
            }) {
                Text(currentPage < 2 ? "Próximo" : "Começar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("greenTertiary"))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.top, 20)
        }
        .background(Color("bluePrimary"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingPageView: View {
    let imageName: String
    let title: String
    let description: String

    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(Color("greenSecondary")) // Ícone principal
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("greenSecondary"))
                .padding(.top, 20)
            
            Text(description)
                .font(.body)
                .foregroundColor(Color("white"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.top, 10)
            
            Spacer()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
