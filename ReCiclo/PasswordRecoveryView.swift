//
//  PasswordRecoveryView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct PasswordRecoveryView: View {
    @State private var email: String = ""
    @State private var isLoading: Bool = false
    @State private var isEmailSent: Bool = false
    @State private var showAlert: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Título
            Text("Recuperar Senha")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("greenTertiary"))

            // Descrição
            Text("Digite o endereço de email associado à sua conta. Enviaremos um link para redefinir sua senha.")
                .font(.body)
                .foregroundColor(Color("bluePrimary"))
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Campo de Email
            TextField("Email", text: $email)
                .padding()
                .background(Color("greenSecondary"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("greenTertiary"), lineWidth: 1)
                )
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            // Botão de Enviar
            Button(action: sendPasswordRecovery) {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Enviar Link de Recuperação")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("greenTertiary"))
            .cornerRadius(10)

            Spacer()

            // Link para voltar ao login
            HStack {
                Text("Lembrou sua senha?")
                    .foregroundColor(Color("greenSecondary"))

                Button(action: navigateToLogin) {
                    Text("Faça login")
                        .foregroundColor(Color("greenSecondary"))
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("greenSecondary"), Color("greenTertiary")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            )
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(isEmailSent ? "Email Enviado" : "Erro"),
                message: Text(isEmailSent ? "Verifique sua caixa de entrada para redefinir sua senha." : "Por favor, insira um email válido."),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    // Funções de Ação
    func sendPasswordRecovery() {
        guard !email.isEmpty, email.contains("@") else {
            showAlert = true
            isEmailSent = false
            return
        }

        isLoading = true
        // Simulação de envio de email
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            isEmailSent = true
            showAlert = true
        }
    }

    func navigateToLogin() {
        print("Redirecionar para a tela de login.")
    }
}

struct PasswordRecoveryView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRecoveryView()
    }
}
